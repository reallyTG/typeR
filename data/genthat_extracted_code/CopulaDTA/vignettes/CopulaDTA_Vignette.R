## ---- results='hide'-----------------------------------------------------
#install.packages("CopulaDTA", dependencies = TRUE)
library(CopulaDTA)	

## ---- eval=FALSE---------------------------------------------------------
#  data(telomerase)
#  telomerase

## ---- echo=FALSE---------------------------------------------------------
telomerase

## ---- eval=FALSE---------------------------------------------------------
#  data(ascus)
#  ascus

## ---- echo=FALSE---------------------------------------------------------
ascus

## ---- echo=FALSE---------------------------------------------------------
library(httr)

mylink <- GET(url="https://www.dropbox.com/s/0w3dp1o0y91o9ug/RIntermediatefiles9thOctober2017.RData?dl=1")
load(rawConnection(mylink$content))

## ------------------------------------------------------------------------
gauss.1 <- cdtamodel("gauss") 	

## ---- eval=FALSE---------------------------------------------------------
#  print(gauss.1)
#  str(gauss.1)

## ---- eval=FALSE---------------------------------------------------------
#  fitgauss.1 <- fit(
#  		gauss.1,
#  		data = telomerase,
#  		SID = "ID",
#  		iter = 28000,
#  		warmup = 1000,
#  		thin = 30,
#  		seed = 3)

## ---- fig.width=7--------------------------------------------------------
traceplot(fitgauss.1)

## ------------------------------------------------------------------------
print(fitgauss.1, digits = 4)

## ---- fig.width=7, fig.height=5------------------------------------------
plot(fitgauss.1)

## ---- eval=FALSE---------------------------------------------------------
#  c90.1 <- cdtamodel(copula = "c90")
#  
#  fitc90.1 <- fit(c90.1,
#                  data=telomerase,
#                  SID="ID",
#                  iter=28000,
#                  warmup=1000,
#                  thin=30,
#                  seed=718117096)
#  
#  c270.1 <- cdtamodel(copula = "c270")
#  
#  fitc270.1 <- fit(c270.1,
#                   data=telomerase,
#                   SID="ID",
#                   iter=19000,
#                   warmup=1000,
#                   thin=20,
#                   seed=3)
#  
#  fgm.1 <- cdtamodel(copula = "fgm")
#  
#  fitfgm.1 <- fit(fgm.1,
#                  data=telomerase,
#                  SID="ID",
#                  iter=19000,
#                  warmup=1000,
#                  thin=20,
#                  seed=3)
#  
#  
#  frank.1 <- cdtamodel(copula = "frank")
#  
#  fitfrank.1 <- fit(frank.1,
#                    data=telomerase,
#                    SID="ID",
#                    iter=19000,
#                    warmup=1000,
#                    thin=20,
#                    seed=1959300748)
#  

## ------------------------------------------------------------------------
BRMA1 <- "
data{
    int<lower = 0> N;              
    int<lower = 0> tp[N];
    int<lower = 0>  dis[N];
    int<lower = 0>  tn[N];
    int<lower = 0>  nondis[N];
}
parameters{
    real etarho;                 
    vector[2] mul;               
    vector<lower = 0>[2] sigma; 
    vector[2] logitp[N];
    vector[2] logitphat[N]; 
}
transformed parameters{
    vector[N] p[2];
    vector[N] phat[2];            
    
    real MU[2];
    vector[2] mu;               
    real rho;					
    real ktau;                   
    matrix[2,2] Sigma; 
    
    rho = tanh(etarho); 
    ktau = (2/pi())*asin(rho);
    
    for (a in 1:2){
        for (b in 1:N){
            p[a][b] = inv_logit(logitp[b][a]);
            phat[a][b] = inv_logit(logitphat[b][a]);
        }
        mu[a] = inv_logit(mul[a]);
    }
    
    MU[1] = mean(phat[1]); 
    MU[2] = mean(phat[2]); 
    
    Sigma[1, 1] = sigma[1]^2;
    Sigma[1, 2] = sigma[1]*sigma[2]*rho;
    Sigma[2, 1] = sigma[1]*sigma[2]*rho;
    Sigma[2, 2] = sigma[2]^2;
}
model{
    etarho ~ normal(0, 10);
    mul ~ normal(0, 10);
    sigma ~ cauchy(0, 2.5);
    
    for (i in 1:N){
        logitp[i] ~ multi_normal(mul, Sigma);
        logitphat[i] ~ multi_normal(mul, Sigma);
    }
    
    tp ~ binomial(dis,p[1]);
    tn ~ binomial(nondis, p[2]);

}
generated quantities{
    vector[N*2] loglik;
    
    for (i in 1:N){
        loglik[i] = binomial_lpmf(tp[i]| dis[i], p[1][i]);
    }
    for (i in (N+1):(2*N)){
        loglik[i] = binomial_lpmf(tn[i-N]| nondis[i-N], p[2][i-N]);
    }
}
"

## ------------------------------------------------------------------------
datalist = list(
    	tp = telomerase$TP,
    	dis = telomerase$TP + telomerase$FN,
    	tn = telomerase$TN,
    	nondis = telomerase$TN + telomerase$FP,
    	N = 10)	

## ---- eval=FALSE---------------------------------------------------------
#  brma.1 <- stan(model_code = BRMA1,
#  		data = datalist,
#  		chains = 3,
#  		iter = 5000,
#  		warmup = 1000,
#  		thin = 10,
#  		seed = 3,
#  		cores = 3)

## ------------------------------------------------------------------------
print(brma.1, pars=c('MU', 'mu', 'rho', "Sigma"), digits=4, prob=c(0.025, 0.5, 0.975))

## ---- fig.show='hide'----------------------------------------------------
f1.1 <- traceplot(fitgauss.1)
f1.2 <- traceplot(fitc90.1)
f1.3 <- traceplot(fitc270.1)
f1.4 <- traceplot(fitfgm.1)
f1.5 <- traceplot(fitfrank.1)

#draws <- as.array(brma.1, pars=c('MU'))
f1.6 <- rstan::stan_trace(brma.1, pars=c('MU'))
    
    

## ---- fig.width=8, fig.height=5------------------------------------------
library(Rmisc)

multiplot(f1.1, f1.2, f1.3, f1.4, f1.5, f1.6, cols=2)


## ------------------------------------------------------------------------
brma.summary1 <- data.frame(Parameter=c("Sensitivity", "Specificity", "Correlation", "Var(lSens)", "Sigma[1,2]", "Sigma[2,1]","Var(lSpec)"),
                            summary(brma.1, pars=c('MU', 'ktau', 'Sigma'))$summary[,c(1, 4, 6, 8:10)])

brma.summary1 <- brma.summary1[-c(5,6),]
 
names(brma.summary1)[2:5] <- c("Mean", "Lower", "Median", "Upper")

library(loo)

Table1 <- cbind(Model=rep(c("Gaussian", "C90", "C270", "FGM", "Frank", "BRMA"), each=5),
                rbind(summary(fitgauss.1)$Summary,
                      summary(fitc90.1)$Summary,
                      summary(fitc270.1)$Summary,
                      summary(fitfgm.1)$Summary,
                      summary(fitfrank.1)$Summary,
                      brma.summary1),
                WAIC = t(data.frame(rep(c(summary(fitgauss.1)$WAIC[1],
                                          summary(fitc90.1)$WAIC[1],
                                          summary(fitc270.1)$WAIC[1],
                                          summary(fitfgm.1)$WAIC[1],
                                          summary(fitfrank.1)$WAIC[1],
                                          loo::waic(extract_log_lik(brma.1, parameter_name="loglik"))[3]), each=5))))

rownames(Table1) <- NULL

print(Table1, digits=4)


## ---- fig.width=7, fig.height=5------------------------------------------
g1 <- ggplot(Table1[Table1$Parameter %in% c("Sensitivity", "Specificity"),], 
             aes(x=Model, 
                 y= Mean)) +
    geom_point(size=3) +
    theme_bw() + 
    coord_flip() +
    facet_grid(~ Parameter, switch="x") +
    geom_errorbar(aes(ymin=Lower, 
                      ymax=Upper),
                  size=.75, 
                  width=0.15) +
    theme(axis.text.x = element_text(size=13, colour='black'), 
          axis.text.y = element_text(size=13, colour='black'),
          axis.title.x = element_text(size=13, colour='black'), 
          strip.text = element_text(size = 13, colour='black'),
          axis.title.y= element_text(size=13, angle=0, colour='black'),
          strip.text.y = element_text(size = 13, colour='black'),
          strip.text.x = element_text(size = 13, colour='black'),
          plot.background = element_rect(fill = "white", colour='white'),
          panel.grid.major = element_blank(),
          panel.background = element_blank(),
          strip.background = element_blank(),
          axis.line.x = element_line(color = 'black'),
          axis.line.y = element_line(color = 'black')) +
    scale_y_continuous(name="Mean [95% equal-tailed credible intervals]", 
                       limits=c(0.45,1.1),
                       breaks=c(0.5, 0.75, 1),
                       labels = c("0.5", "0.75", "1"))

g1


## ---- eval=FALSE---------------------------------------------------------
#  fgm.2 <-  cdtamodel(copula = "fgm",
#                      modelargs = list(formula.se = StudyID ~ Test + 0))
#  fitfgm.2 <- fit(fgm.2,
#                  data=ascus,
#                  SID="StudyID",
#                  iter=19000,
#                  warmup=1000,
#                  thin=20,
#                  seed=3)
#  
#  
#  gauss.2 <-  cdtamodel(copula = "gauss",
#                       modelargs = list(formula.se = StudyID ~ Test + 0))
#  fitgauss.2 <- fit(gauss.2,
#                    data=ascus,
#                    SID="StudyID",
#                    iter=19000,
#                    warmup=1000,
#                    thin=20,
#                    seed=3)
#  
#  c90.2 <-  cdtamodel(copula = "c90",
#                       modelargs = list(formula.se = StudyID ~ Test + 0))
#  fitc90.2 <- fit(c90.2,
#                  data=ascus,
#                  SID="StudyID",
#                  iter=19000,
#                  warmup=1000,
#                  thin=20,
#                  seed=3)
#  
#  c270.2 <-  cdtamodel(copula = "c270",
#                       modelargs = list(formula.se = StudyID ~ Test + 0))
#  fitc270.2 <- fit(c270.2,
#                   data=ascus,
#                   SID="StudyID",
#                   iter=19000,
#                   warmup=1000,
#                   thin=20,
#                   seed=3)
#  
#  frank.2 <-  cdtamodel(copula = "frank",
#                       modelargs = list(formula.se = StudyID ~ Test + 0))
#  fitfrank.2 <- fit(frank.2,
#                    data=ascus,
#                    SID="StudyID",
#                    iter=19000,
#                    warmup=1000,
#                    thin=20,
#                    seed=3)
#  

## ---- eval=FALSE---------------------------------------------------------
#  BRMA2 <- "
#  data{
#      int<lower=0> N;
#      int<lower=0> tp[N];
#      int<lower=0>  dis[N];
#      int<lower=0>  tn[N];
#      int<lower=0>  nondis[N];
#      matrix<lower=0>[N,2] x;
#  }
#  parameters{
#      real etarho;                 // g(rho)
#      matrix[2,2] betamul;
#      vector<lower=0>[2] sigma;
#      vector[2] logitp[N];
#      vector[2] logitphat[N];
#  }
#  transformed parameters{
#      row_vector[2] mul_i[N];
#      vector[N] p[2];
#      vector[N] phat[2];   //expit transformation
#      matrix[2,2] mu;
#  	real rho;                   //pearsons correlation
#      real ktau;                   //Kendall's tau
#  	matrix[2,2] Sigma;  //Variance-covariance matrix
#  	matrix[2,2] MU;
#      row_vector[2] RR;
#  
#      rho = tanh(etarho); //fisher z back transformation
#      ktau = (2/pi())*asin(rho);
#  
#      for (j in 1:2){
#          for (k in 1:2){
#              mu[j, k] = inv_logit(betamul[j, k]);
#          }
#      }
#  
#      for (a in 1:N){
#  		mul_i[a] = row(x*betamul,a);
#          for (b in 1:2){
#              p[b][a] = inv_logit(logitp[a][b]);
#              phat[b][a] = inv_logit(logitphat[a][b]);
#          }
#      }
#  
#  	MU[1,1] = sum(col(x, 1).*phat[1])/sum(col(x, 1)); //sensitivity HC2
#      MU[1,2] = sum(col(x, 1).*phat[2])/sum(col(x, 1)); //specificity HC2
#      MU[2,1] = sum(col(x, 2).*phat[1])/sum(col(x, 2)); //sensitivity RepC
#      MU[2,2] = sum(col(x, 2).*phat[2])/sum(col(x, 2)); //specificity RepC
#      RR = row(MU, 2)./row(MU, 1); //RepC vs HC2
#  
#      Sigma[1, 1] = sigma[1]^2;
#      Sigma[1, 2] = sigma[1]*sigma[2]*rho;
#      Sigma[2, 1] = sigma[1]*sigma[2]*rho;
#      Sigma[2, 2] = sigma[2]^2;
#  
#  }
#  model{
#      #Priors
#      etarho ~ normal(0, 10);
#      sigma ~ cauchy(0, 2.5);
#  
#      for (i in 1:2){
#          betamul[i] ~ normal(0, 10);
#      }
#  
#      for (l in 1:N){
#          logitp[l] ~ multi_normal(mul_i[l], Sigma);
#          logitphat[l] ~ multi_normal(mul_i[l], Sigma);
#      }
#  
#      //Likelihood
#      tp ~ binomial(dis,p[1]);
#      tn ~ binomial(nondis, p[2]);
#  
#  
#  }
#  generated quantities{
#      vector[N*2] loglik;
#  
#      for (i in 1:N){
#          loglik[i] = binomial_lpmf(tp[i]| dis[i], p[1][i]);
#      }
#      for (i in (N+1):(2*N)){
#          loglik[i] = binomial_lpmf(tn[i-N]| nondis[i-N], p[2][i-N]);
#      }
#  }
#  "
#  
#  datalist2 <- list(
#      tp = ascus$TP,
#      dis = ascus$TP + ascus$FN,
#      tn = ascus$TN,
#      nondis = ascus$TN + ascus$FP,
#      N = 20,
#      x = structure(.Data=c(2-as.numeric(as.factor(ascus$Test)),
#                            rev(2-as.numeric(as.factor(ascus$Test)))),
#                    .Dim=c(20, 2)))
#  
#  brma.2 <- stan(model_code = BRMA2,
#                 data = datalist2,
#                 chains = 3,
#                 iter = 5000,
#                 warmup = 1000,
#                 thin = 10,
#                 seed = 3,
#                 cores=3)
#  

## ---- fig.show='hide'----------------------------------------------------
f2.1 <- traceplot(fitgauss.2)
f2.2 <- traceplot(fitc90.2)
f2.3 <- traceplot(fitc270.2)
f2.4 <- traceplot(fitfgm.2)
f2.5 <- traceplot(fitfrank.2)

#draws <- as.array(brma.2, pars=c('MU'))
f2.6  <- rstan::stan_trace(brma.2, pars=c('MU'))

## ---- fig.width=8, , fig.height=10---------------------------------------
multiplot(f2.1, f2.2, f2.3, f2.4, f2.5, f2.6, cols=2)


## ------------------------------------------------------------------------
brma.summary2 <- data.frame(Parameter=c(rep(c("Sensitivity", "Specificity"), times=2), "RSE", "RSP", "Var(lSens)",
                                        "Cov(lSens_Spec)", "Cov(lSens_Spec)", "Var(lSpec)", "Correlation"),
                            Test=c(rep(c("HC2", "Repc"), times=2), rep("Repc", 2), rep("Both", 5)),
                           summary(brma.2, pars=c('MU', "RR", 'Sigma', 'ktau'))$summary[,c(1, 4, 6, 8:10)])

names(brma.summary2)[3:6] <- c("Mean", "Lower", "Median", "Upper")

Table2 <- cbind(Model=rep(c("Gaussian", "C90", "C270", "FGM", "Frank"), each=14),
                Test=rep(c("HC2", "Repc"), length.out=70),
                rbind(summary(fitgauss.2)$Summary,
                      summary(fitc90.2)$Summary,
                      summary(fitc270.2)$Summary,
                      summary(fitfgm.2)$Summary,
                      summary(fitfrank.2)$Summary),
                WAIC = t(data.frame(rep(c(summary(fitgauss.2)$WAIC[1],
                                          summary(fitc90.2)$WAIC[1],
                                          summary(fitc270.2)$WAIC[1],
                                          summary(fitfgm.2)$WAIC[1],
                                          summary(fitfrank.2)$WAIC[1]), each=14))))

Table2$Parameter <- rep(rep(c("Sensitivity", "Specificity", "RSE", "RSP", "Correlation", "Var(Sens)", "Var(Spec)"), each=2), times=5)

Table2 <- rbind(Table2, cbind(Model=rep("BRMA", 11),
                              brma.summary2,
                              WAIC=t(data.frame(rep(loo::waic(extract_log_lik(brma.2, parameter_name="loglik"))[3], 11)))))

rownames(Table2) <- NULL
print(Table2[Table2$Parameter=="Correlation",], digits=4)


## ---- fig.width=7, fig.height=5------------------------------------------
g2 <- ggplot(Table2[Table2$Parameter %in% c("RSE", "RSP") & (Table2$Test == "Repc") ,], 
             aes(x=Model, y= Mean, ymax=1.5)) +
    geom_point(size=3) +
    theme_bw() + 
    coord_flip() +
    facet_grid(~ Parameter, switch="x") +
    geom_errorbar(aes(ymin=Lower, ymax=Upper),size=.75, width=0.15) +
    geom_hline(aes(yintercept = 1),
                                linetype = "longdash",
                                colour="blue") +
    theme(axis.text.x = element_text(size=13, colour='black'), 
          axis.text.y = element_text(size=13, colour='black'),
          axis.title.x = element_text(size=13, colour='black'), 
          strip.text = element_text(size = 13, colour='black'),
          axis.title.y= element_text(size=13, angle=0, colour='black'),
          strip.text.y = element_text(size = 13, colour='black'),
          strip.text.x = element_text(size = 13, colour='black'),
          panel.grid.major = element_blank(),
          panel.background = element_blank(),
          strip.background = element_blank(),
          plot.background = element_rect(fill = "white", colour='white'),
          axis.line.x = element_line(color = 'black'),
          axis.line.y = element_line(color = 'black')) +
    scale_y_continuous(name="Mean [95% equal-tailed credible intervals]", 
                       limits=c(0.5, 2))
g2

