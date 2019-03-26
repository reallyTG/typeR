library(InferenceSMR)


### Name: screening
### Title: A population of size 10,000 for a screening program
### Aliases: screening

### ** Examples

require(survival); #load survival package;
data(screening);
head(screening); #Data to be used in the example;
NB = nrow(screening); #Sample size

#Be careful with R round function. If it was used to obtain discrete value, then
#fuzz option should be used for expected and expected variance 
i=1:NB
yearSCN<-screening[i,1]; #Year at which the woman started participating
ageSCN<-screening[i,2]; #Age at which the woman started participating
yearONS<-screening[i,3]; #Year of breast cancer diagnosis
deathBC<-screening[i,4]; #Death by breast cancer indicator for non-participating woman.
ageFL<-screening[i,5]; #Age at which the woman became eligible
yearFL<-screening[i,6]; #Year at which the woman became eligible
followONS<-screening[i,7]; #Follow-up time after disease onset for a non-participant
followSCN<-screening[i,8]; #Follow-up time as a participant in the screening program
particip<-screening[i,9]; #Indicator that the woman participated into the screening
                          #program at some point
Onset<-screening[i,10]; #Indicator that the non-participating woman got breast cancer
end<-screening[i,11]; #year of eligibility end.
deathSCN<-screening[i,12]; #Death by breast cancer indicator for participating woman.

nb_onset=length(Onset[Onset==1]); #Number of women with breast cancer

#Objects that will containt covariates for the Cox model
year<-numeric(nb_onset); 
age1<-numeric(nb_onset);
age2<-numeric(nb_onset);
age3<-numeric(nb_onset);
age4<-numeric(nb_onset);
ti<-numeric(nb_onset);

year[yearONS[Onset==1] <= 3] = 1; #Indicator that diagnosis happened before year 3
year[yearONS[Onset==1] > 3] = 0; #Indicator that diagnosis happened before year 3
age1[ageSCN[Onset==1] < 55] = 1; #Indicator that age at diagnosis is smaller than 55
age1[ageSCN[Onset==1] >= 55] = 0; #Indicator that age at diagnosis is smaller than 55
age2[ageSCN[Onset==1] >= 55 & ageSCN[Onset==1] < 60] = 1; #... >= 55 and < 60
age2[ageSCN[Onset==1] < 55 | ageSCN[Onset==1] >= 60] = 0; #... >= 55 and < 60
age3[ageSCN[Onset==1] >= 60 & ageSCN[Onset==1] < 65] = 1; #... >= 60 and < 65
age3[ageSCN[Onset==1] < 60 | ageSCN[Onset==1] >= 65] = 0; #... >= 60 and < 65
age4[ageSCN[Onset==1] >= 65 & ageSCN[Onset==1] < 70] = 1; #... >= 65 and < 70
age4[ageSCN[Onset==1] < 65 | ageSCN[Onset==1] >= 70] = 0; #... >= 65 and < 70
cox.data = data.frame(followONS = followONS[Onset == 1], deathBC = deathBC[Onset == 1],
year, age1, age2, age3, age4);
x<-coxph(Surv(time = followONS, event = deathBC, type = 'right')~ year + age1 + age2 + age3 + age4,
data = cox.data, method="breslow",control=coxph.control(iter.max=100))

#Creating a matrix with many more lines than what will be used
new_data<-matrix(0,nrow=12*sum(particip),ncol=10); 

#Creating a matrix containing data in a new form.
#Each line contains stable covariates, so that a
#given individual might be divided on many lines.
#For example, if only the covariate age is used for incidence and survival, 
#an individual followed for 3.4 years that was 54.6 years at the begining 
#of the study should be entered as follow:

#start_follow, end_follow, incid_cov, surv_cov, follow_up
#0   0.4 54 54 3.4
#0.4 1.4 55 55 3.4
#1.4 2.4 56 56 3.4
#2.4 3.4 57 57 3.4


r=1
for(i in seq(1,length(ageFL))[particip==1])
{
	X = followSCN[i];
	dep_t = yearSCN[i];
	age_t = ageSCN[i];
	while(dep_t - yearSCN[i] < X)
	{
		Y = min(floor(age_t) + 1 - age_t, floor(dep_t) + 1 - dep_t);
		if(dep_t - yearSCN[i] + Y >= X)
		{
			new_data[r,]<-c(floor(age_t), floor(dep_t), age_t < 55,
			(age_t >= 55 && age_t < 60),
			(age_t >= 60 && age_t < 65), (age_t >=65 && age_t <70), 
			dep_t < 3, dep_t - yearSCN[i], X, followSCN[i]);
		}
		else
		{
			new_data[r,]<-c(floor(age_t), floor(dep_t), age_t < 55,
			(age_t >= 55 && age_t < 60),
			(age_t >= 60 && age_t < 65), (age_t >=65 && age_t <70),
			dep_t < 3, dep_t - yearSCN[i], dep_t - yearSCN[i] + Y, followSCN[i]);
		}
		dep_t = dep_t + Y;
		age_t = age_t + Y;
		r = r + 1;
	}
}
new_data<-new_data[new_data[,1]!=0,];
new_data[1:10,];

#Calculate incidences with incidences function:
#follow up time as non-participant:
follow_up = apply(cbind(end - yearFL,yearONS - yearFL,yearSCN - yearFL),1,min);
incid = incidences(50,75,0,5,follow_up,ageFL,yearFL,Onset);


#Calculate contributions with contrib function:
start_follow = new_data[,8];
end_follow = new_data[,9];
incid_cov = new_data[,c(2,1)];
surv_cov = data.frame(new_data[,c(7,3,4,5,6)]); 
follow_up = new_data[,10];
increment = 0.5;


#Remove following "#" to run example : 

#contribution = contrib(start_follow, end_follow, incid_cov, surv_cov,
#follow_up, increment);
#est.expDeath(contribution,incid,x,fuzz = 0.01, 
#covnames = c("year", "age1", "age2", "age3", "age4"));

#Estimating the variance can be very long even in this small sample example, e.g. a few hours.
#Remove the "#" to run example:
#var.expDeath(contribution,incid,x,fuzz = 0.01, 
#covnames = c("year", "age1", "age2", "age3", "age4"));

#Estimating the variance can be very long even in this small sample example, e.g. a few hours.
#Remove the "#" to run example:

#results = inference.SMR(obs.death = sum(deathSCN), normal = c("smr", "log-smr", "root-smr"),
#	 alpha = 0.05, contribution, incid, cox = x, fuzz = 0.01, Poisson = TRUE,
#  covnames =  c("annees", "age1", "age2", "age3", "age4"));


#********  INFERENCE ABOUT THE SMR  ********* 
#
#Observed =  18  Expected =  33.44264 
#Obs.var. =  18  Exp.var. =  39.38153 
#SMR =  0.5382351 
#
# 95 % Confidence intervals with normality assumption at : 
#
#The SMR level : ( 0.2204119 0.8560583 )
#
#The log-SMR level : ( 0.2982118 0.9714471 )
#
#The root-SMR level : ( 0.2673299 0.9029762 )

#results
#
#$expected
#[1] 33.44264
#
#$obs.death
#[1] 18
#
#$variance
#            2
#[1,] 39.38153
#
#$smr
#[1] 0.5400112
#
#$smr.var
#              2
#[1,] 0.02629511
#
#$smr.ci
#[1] 0.2204119 0.8560583
#
#$logSMR.var
#              2
#[1,] 0.09076763
#
#$logSMR.ci
#[1] 0.2982118 0.9714471
#
#$rootSMR.var
#              2
#[1,] 0.01221358
#
#$rootSMR.ci
#[1] 0.2673299 0.9029762




