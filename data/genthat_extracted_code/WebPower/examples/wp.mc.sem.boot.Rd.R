library(WebPower)


### Name: wp.mc.sem.boot
### Title: Statistical Power Analysis for Structural Equation Modeling /
###   Mediation based on Monte Carlo Simulation: bootstrap method
### Aliases: wp.mc.sem.boot

### ** Examples

## Not run: 
##D #To specify the model
##D demo ="
##D 		y ~ cp*x + start(0)*x + b*m + start(0.39)* m
##D 		m ~ a*x + start(0.39)*x
##D 		x ~~ start(1)*x
##D 		m ~~ start(1)*m
##D 		y ~~ start(1)*y
##D 	"
##D #To specify the indirect effects
##D mediation = "
##D 		ab := a*b
##D 		abc:= a*b + cp
##D " 
##D #Power for mediation based on MC method when bootstrap method is used to test the effects:
##D mediation.boot = wp.mc.sem.boot(model=demo, indirect=mediation, nobs=100,
##D                                nrep=1000, nboot=2000, parallel="parallel",
##D              skewness=c(0, 0, 1.3), kurtosis=c(0,0,10), ovnames=c("x","m","y"))
##D 
##D #To print the power analysis results
##D summary(mediation.boot)
##D 
##D #Example: Power for Simple Mediation Analysis
##D ex1model <- "
##D 		math ~ c*ME + start(0)*ME + b*HE + start(0.39)*HE
##D 		HE ~ a*ME + start(0.39)*ME
##D "
##D 
##D indirect <- "ab:=a*b"
##D 
##D boot.normal <- wp.mc.sem.boot(ex1model,indirect, 50, nrep=2000,
##D                                 nboot=2000, parallel='parallel')
##D summmary(boot.normal) 
##D 
##D boot.non.normal <- wp.mc.sem.boot(ex1model,indirect, 100, nrep=2000,
##D                    nboot=2000, parallel='parallel', skewness=c(-0.3, -0.7, 1.3),
##D                               kurtosis=c(1.5, 0, 5), ovnames=c('ME','HE','math'))
##D summmary(boot.non.normal) 
##D 
##D #Example: Multiple Group Mediation Analysis (Moderated Mediation)
##D ex3model <- "
##D 		y ~ start(c(0.283, 0.283))*x + c(c1,c2)*x + start(c(0.36, 0.14))*m + c(b1,b2)*m
##D 		m ~ start(c(0.721, 0.721))*x + c(a1,a2)*x
##D 		m =~ c(1,1)*m1 + start(c(0.8, 0.8))*m2 + start(c(0.8, 0.8))*m3
##D 		x ~~ start(c(0.25, 0.25))*x
##D 		y ~~ start(c(0.81, 0.95))*y
##D 		m ~~ start(c(0.87, 0.87))*m
##D 		m1 ~~ start(c(0.36, 0.36))*m1
##D 		m2 ~~ start(c(0.36, 0.36))*m2
##D 		m3 ~~ start(c(0.36, 0.36))*m3
##D "
##D 
##D # med1 and med2 are the mediation effect for group1 and group2, respectively.
##D indirect <- "
##D 		med1 := a1*b1
##D 		med2 := a2*b2
##D 		diffmed := a1*b1 - a2*b2
##D "
##D 
##D bootstrap <- wp.mc.sem.boot(ex3model, indirect, nobs=c(400,200),
##D                               nrep=2000, nboot=1000, prallel='parallel')
##D summary(bootstrap) 
##D 
##D #Example: A Longitudinal Mediation Model
##D ex4model <- "
##D x2 ~ start(.9)*x1 + x*x1
##D x3 ~ start(.9)*x2 + x*x2
##D m2 ~ start(.3)*x1 + a*x1 + start(.3)*m1 + m*m1
##D m3 ~ start(.3)*x2 + a*x2 + start(.3)*m2 + m*m2
##D y2 ~ start(.3)*m1 + b*m1 + start(.7)*y1 + y*y1
##D y3 ~ start(.3)*m2 + b*m2 + start(.7)*y2 + y*y2 + start(0)*x1 + c*x1
##D x1 ~~ start(.37)*m1
##D x1 ~~ start(.27)*y1
##D y1 ~~ start(.2278)*m1
##D x2 ~~ start(.19)*x2
##D x3 ~~ start(.19)*x3
##D m2 ~~ start(.7534)*m2
##D m3 ~~ start(.7534)*m3
##D y2 ~~ start(.3243)*y2
##D y3 ~~ start(.3243)*y3
##D "
##D 
##D indirect <- "ab := a*b"
##D 
##D bootstrap <- wp.mc.sem.boot(ex4model, indirect, nobs=50, nrep=1000,
##D                              nboot=1000, parallel='parallel', ncore=8)
##D summary(bootstrap)
## End(Not run)




