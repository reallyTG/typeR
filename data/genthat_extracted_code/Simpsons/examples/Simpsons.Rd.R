library(Simpsons)


### Name: Simpsons
### Title: Simpsons
### Aliases: Simpsons

### ** Examples

## Not run: 
##D #This section contains three examples of the types of analyses you can run
##D #using the 'Simpsons' function, illustrating the commmands and the types of #output.
##D 
##D #Example 1. Here, we want to estimate the relationship between 'Coffee' 
##D #and 'Neuroticism', taking into account possible gender differences. 
##D #As we have measured gender, we supply this information using the #'clusterid' command. 
##D #This means that the function runs the analysis both for 
##D #the dataset as a whole and within the two subgroups. 
##D #It then checks whether the subgroups deviate significantly 
##D #from the regression at the level of the group.
##D 
##D 	#Simulating 100 males 
##D 	coffeem=rnorm(100,100,15)
##D 	neuroticismm=(coffeem*.8)+rnorm(100,15,8)
##D 	clusterid=rep(1,100)
##D 	males=cbind(coffeem,neuroticismm,clusterid)
##D 
##D 	#Simulating 100 females
##D 	coffeef=rnorm(100,100,15)
##D 	neuroticismf=160+((coffeef*-.8)+rnorm(100,15,8))
##D 	clusterid=rep(2,100)
##D 	females=cbind(coffeef,neuroticismf,clusterid)
##D 	
##D 	data=data.frame(rbind(males,females))
##D 	colnames(data) <- c("Coffee","Neuroticism","gender")
##D 
##D #'normal' data analysis: Plot & regression
##D plot(data[,1:2])
##D a=lm(data[,1]~data[,2])
##D abline(a)
##D summary(a) #A normal regression shows no effect
##D 
##D #Running a Simpsons Paradox analysis, using gender as known clustering #variable
##D example1=Simpsons(Coffee,Neuroticism,clusterid=gender, data=data) 
##D # Analyze the relationship between coffee and neuroticism for both males 
##D # and females. 
##D example1
##D 
##D 
##D 
##D #example 2. Here we estimate the relationship between 'Coffee' and 'Neuroticism'. 
##D #As opposed to example 1, we have not measured any possible clustering #identifiers 
##D #such as gender, so we want to estimate whether there is evidence for #clustering based 
##D #only on the data we measured: Coffee and Neuroticism.
##D 
##D #generating data 
##D Coffee1=rnorm(100,100,15)
##D Neuroticism1=(Coffee1*.8)+rnorm(100,15,8)
##D g1=cbind(Coffee1, Neuroticism1)
##D Coffee2=rnorm(100,170,15)
##D Neuroticism2=(300-(Coffee2*.8)+rnorm(100,15,8))
##D g2=cbind(Coffee2, Neuroticism2)
##D Coffee3=rnorm(100,140,15)
##D Neuroticism3=(200-(Coffee3*.8)+rnorm(100,15,8))
##D g3=cbind(Coffee3, Neuroticism3)
##D data2=data.frame(rbind(g1,g2,g3))
##D colnames(data2) <- c("Coffee","Neuroticism")
##D 
##D #'normal' data analysis: Plot & regression
##D plot(data2)
##D b=lm(data2[,1]~data2[,2]) 
##D summary(b)
##D abline(b)
##D 
##D # Running the analysis tool identifies three clusters, and warns that the relationship 
##D between alcohol and coffee is in the opposite direction in two of the subclusters.
##D example2=Simpsons(Coffee,Neuroticism,data=data2) 
##D example2
##D 
##D #example3: 
##D 
##D #In this final example, we want again want to analyse the relationship
##D # between 'Alcohol' and 'Mood'. However, this time 
##D #we have reason to believe that responses to a questionnaire 
##D #will fall into clusters of response types. Therefore, we want to
##D # estimate the clusters in the data on the basis of a different set
##D # of variables. In this case, we have simulate three types of responses
##D # to a questionnaire of nine questions, with continuous responses 
##D #ranging between 1 and 7. We then first estimate the clusters on 
##D #the basis of the questionnaire, and then examine the relationship 
##D #between 'Alcohol' and 'Mood' based on these detected clusters.
##D 
##D #group 1
##D signal=matrix(rnorm(300,7,1),100,3)
##D noise=matrix(rnorm(600,3.5,1),100,6)
##D g1=cbind(signal,noise)
##D 
##D #group 2
##D signal=matrix(rnorm(300,1,1),100,3)
##D noise=matrix(rnorm(600,3.5,1),100,6)
##D g2=cbind(noise, signal)
##D 
##D #group 3
##D signal=matrix(rnorm(300,7,1),100,3)
##D noise1=matrix(rnorm(300,3.5,1),100,3)
##D noise2=matrix(rnorm(300,3.5,1),100,3)
##D g3=cbind(noise1,signal,noise2)
##D 
##D questionnaire=rbind(g1,g2,g3)
##D colnames(questionnaire)=c('q1','q2','q3','q4','q5','q6','q7','q8','q9')
##D 
##D Alc1=rnorm(100,10,8)
##D Mood1=(Alc1*.4)+rnorm(100,3,4)
##D A=cbind(Alc1, Mood1)
##D Alc2=rnorm(100,15,8)
##D Mood2=(Alc2*-.4)+rnorm(100,3,4)
##D B=cbind(Alc2,Mood2)
##D Alc3=rnorm(100,20,8)
##D Mood3=(Alc3*.8)+rnorm(100,3,4)
##D C=cbind(Alc3,Mood3)
##D data=data.frame(rbind(A,B,C))
##D colnames(data) <- c("Alcohol","Mood")
##D alldata=cbind(questionnaire,data)
##D alldata=as.data.frame(alldata)
##D 
##D #Run Simpsons Paradox detection algorithm, clustering on the basis of the questionnaire
##D example3=Simpsons(Alcohol,Mood,clustervars=c("q1","q2",'q3','q4',
##D 'q5','q6','q7','q8','q9'),data=alldata)
##D example3 
## End(Not run)



