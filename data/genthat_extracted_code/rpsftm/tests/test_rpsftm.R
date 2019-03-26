library(rpsftm)
library(survival)
context("Test the rpsftm() function")




test_that("first basict fit with mixed data sources",{
  propX <- with(immdef,1-xoyrs/progyrs)
  fit <- rpsftm(Surv(progyrs, prog)~rand(imm,propX),immdef, censyrs)
  expect_is(fit$psi, "numeric")
})



test_that("print method",{
  fit <- rpsftm(Surv(progyrs, prog)~rand(imm,1-xoyrs/progyrs),immdef, censor_time = censyrs)
  fit_coxph <- rpsftm(Surv(progyrs, prog)~rand(imm,1-xoyrs/progyrs),immdef, censor_time = censyrs, 
                test=coxph)
  fit_survreg <- rpsftm(Surv(progyrs, prog)~rand(imm,1-xoyrs/progyrs),immdef, censor_time = censyrs,
                        test=survreg)
  expect_output(print(fit),"exp\\(psi\\):")
  expect_output(print(fit_coxph),"exp\\(psi\\):")
  expect_output(print(fit_survreg),"exp\\(psi\\):")
  #this is a test that the end of file is valid witha new line - a warning is issued from readLines()
  expect_failure(expect_warning(
    {
      file <- tempfile()
      sink(file)
      print(fit)
      sink()
      readLines(file, warn=TRUE)
    }))
  
})



test_that("summary method",{
  fit <- rpsftm(Surv(progyrs, prog)~rand(imm,1-xoyrs/progyrs),immdef, censor_time = censyrs,
                low_psi=-1, hi_psi=1)
  fit_coxph <- rpsftm(Surv(progyrs, prog)~rand(imm,1-xoyrs/progyrs),immdef, censor_time = censyrs, 
                      test=coxph)
  fit_survreg <- rpsftm(Surv(progyrs, prog)~rand(imm,1-xoyrs/progyrs),immdef, censor_time = censyrs,
                        test=survreg)
  expect_output(summary(fit),"Confidence Interval")
  expect_output(summary(fit_coxph),"Confidence Interval")
  expect_output(summary(fit_survreg),"Confidence Interval")
  #this is a test that the end of file is valid witha new line - a warning is issued from readLines()
  expect_failure(expect_warning(
    {
      file <- tempfile()
      sink(file)
      summary(fit)
      sink()
      readLines(file, warn=TRUE)
    }))
  
  
})

context("Placemarker for end of end-of-line tests")

test_that("detailed print.coxph test",{
  x <- list(fail="yes")
  class(x) <- "rpsftm"
  expect_output(print(x),"Fitting failed")
  class(x) <- "coxph"
  expect_output(print(x),"Coxph failed")
  site <- rep(1:10,each=100)
  fit_coxph <- rpsftm(Surv(progyrs, prog)~rand(imm,1-xoyrs/progyrs)+cluster(site)+entry,immdef, censor_time = censyrs, 
                      test=coxph)
  expect_output(print(fit_coxph),"robust")
    
}
)

test_that("detailed print.summary.coxph test",{
  site <- rep(1:10,each=100)
  fit_coxph <- rpsftm(Surv(progyrs, prog)~rand(imm,1-xoyrs/progyrs)+entry,immdef, censor_time = censyrs, 
                      test=coxph)
  expect_output(summary(fit_coxph),"coef")
  
  fit_coxph$fail <- "yes"
  expect_output(summary(fit_coxph),"Coxreg failed")
}
)


test_that("detailed print.survreg test",{
  x <- list(fail="yes")
  class(x) <- "survreg"
  expect_output(print(x),"Survreg failed")
  site <- rep(1:10,each=100)
  fit <- rpsftm(Surv(progyrs, prog)~rand(imm,1-xoyrs/progyrs)+entry,immdef, censor_time = censyrs, 
                      test=survreg, scale=1)
  expect_output(print(fit),"Scale fixed at")
 
  
  
  fit <- rpsftm(Surv(progyrs, prog)~rand(imm,1-xoyrs/progyrs)+strata(site),immdef, censor_time = censyrs, 
                test=survreg)
  expect_output(print(fit),"Scale:")
  
}
)

test_that("detailed print.summary.survreg test",{
  site <- rep(1:10,each=100)
  fit <- rpsftm(Surv(progyrs, prog)~rand(imm,1-xoyrs/progyrs)+entry,immdef, censor_time = censyrs, 
                test=survreg, scale=1)
  expect_output(print(fit),"Scale fixed at")
  
  fit$fail <- "yes"
  expect_output(summary(fit),"Survreg failed")
  fit <- rpsftm(Surv(progyrs, prog)~rand(imm,1-xoyrs/progyrs)+strata(site),immdef, censor_time = censyrs, 
                test=survreg)
  expect_output(summary(fit),"Scale:")
  expect_output(summary(fit,correlation=TRUE),"Correlation of Coefficients")
  
}
)



test_that("plot method",{
  fit <- rpsftm(Surv(progyrs, prog)~rand(imm,1-xoyrs/progyrs),immdef, censor_time = censyrs,
                low_psi=-1, hi_psi=1)
  fig <- plot(fit)
  expect_s3_class(fig, class="ggplot")
  
})


test_that("first basic fit with mixed data source, calculating var in-functions",{
  fit <- rpsftm(Surv(progyrs, prog)~rand(imm,1-xoyrs/progyrs),immdef, censor_time = censyrs)
  expect_is(fit$psi, class="numeric")
})

test_that("first basic fit with the arm as a factor",{
  myArm <- factor(immdef$imm, labels=c("Control","Exper"))
  fit <- rpsftm(Surv(progyrs, prog)~rand(myArm,1-xoyrs/progyrs),immdef, censor_time = censyrs,#formula=~1,
                low_psi=-1, hi_psi=1)
  expect_is(fit$psi, class="numeric")
})



test_that("with no data argument at all",{
  propX <- with(immdef, 1-xoyrs/progyrs)
  fit <- rpsftm(Surv(immdef$progyrs, immdef$prog)~rand(immdef$imm, propX)+immdef$entry,
                censor_time = immdef$censyrs, test=coxph,
              low_psi=-1, hi_psi=1
              )
    expect_is(fit$psi, class="numeric")
  
}
)


test_that("fit with treatment weights",{
  propX <- with(immdef,1-xoyrs/progyrs)
  weight <- with(immdef, ifelse(imm==1, 1, 0.5))
  fit <- rpsftm(Surv(progyrs, prog)~rand(imm,propX),immdef, censor_time = censyrs,treat_modifier=weight,
                low_psi=-1, hi_psi=1)
  expect_is(fit$psi, class="numeric")
})




test_that("Values from a basic fit match up with the Stata output",
          {
            propX <- with(immdef, 1-xoyrs/progyrs)
            fit <- rpsftm(Surv(progyrs, prog)~rand(imm,propX), immdef, censor_time = censyrs ,
                          low_psi=-1, hi_psi=1)
            psivalue <-  -0.1816406 <=fit$psi & fit$psi<= -.1806641 
            ciLower <- -0.3505859<=fit$CI[1] & fit$CI[1]<= -0.3496094
            ciUpper <- 0.0019531<=fit$CI[2] & fit$CI[2]<= 0.0029297
           expect_true(psivalue)
           expect_true(ciLower)
           expect_true(ciUpper)
           })

test_that("Try it with Censoring off",
          {
            fit  <- rpsftm(Surv(progyrs, prog)~rand(imm,1-xoyrs/progyrs),immdef,
                                 low_psi=-1, hi_psi=1)
            expect_s3_class(fit, class="rpsftm")
            
          }
          )
test_that("Try it with autoswitch off",
          {
            fit  <- rpsftm(Surv(progyrs, prog)~rand(imm,1-xoyrs/progyrs),immdef, censor_time = censyrs,
                           low_psi=-1, hi_psi=1, autoswitch = FALSE)
            expect_s3_class(fit, class="rpsftm")
            
          }
)


##Check that swapping the definitions of arm has no effect (on point estimates), and that 1-rx reverses the estimates and CIs

test_that("swapping the definition of arm",
          { propX <- with(immdef, 1-xoyrs/progyrs)
          fit <- rpsftm(Surv(progyrs, prog)~rand(imm,propX), immdef, censor_time = censyrs,
                        low_psi=-1, hi_psi=1)
            propX <- with(immdef, 1-xoyrs/progyrs)
            fitInv <- rpsftm(Surv(progyrs, prog)~rand(1-imm,propX), immdef, censor_time = censyrs,test=survdiff, 
                             low_psi=-1, hi_psi=1)
            expect_true(  abs(fit$psi-fitInv$psi)<1e-4)}
          )
test_that("swapping the definition of rx",
          { propX <- with(immdef, 1-xoyrs/progyrs)
          fit <- rpsftm(Surv(progyrs, prog)~rand(imm,propX), immdef, censor_time = censyrs,
                        low_psi=-1, hi_psi=1)
          propXInv <- 1-with(immdef, 1-xoyrs/progyrs)
          fitInv2 <- rpsftm(Surv(progyrs, prog)~rand(imm,propXInv), immdef, censor_time = censyrs,test=survdiff,
                            low_psi=-1, hi_psi=1)
            expect_true(  abs(fit$psi+fitInv2$psi)<1e-4)}
)

test_that("swapping the definition of arm and rx",
          { propX <- with(immdef, 1-xoyrs/progyrs)
          fit <- rpsftm(Surv(progyrs, prog)~rand(imm,propX), immdef, censor_time = censyrs,
                        low_psi=-1, hi_psi=1)
            propXInv <- 1-with(immdef, 1-xoyrs/progyrs)
            fitInv3 <- rpsftm(Surv(progyrs, prog)~rand(1-imm,propXInv), immdef, censor_time = censyrs,test=survdiff,
                              low_psi=-1, hi_psi=1)
            expect_true(  abs(fit$psi+fitInv3$psi)<1e-4)
            expect_true(  abs(fit$CI[1]+fitInv3$CI[2])<1e-4)
            expect_true(  abs(fit$CI[2]+fitInv3$CI[1])<1e-4)
          }
)

test_that( "no t-test comparison avaialable",
           {propX <- with(immdef,1-xoyrs/progyrs)
           fit <- rpsftm(Surv(progyrs, prog)~rand(imm,propX), immdef, censor_time = censyrs,
                         low_psi=-1, hi_psi=1)
           expect_error( update(fit, test=t.test))}
)



test_that( "check variants on fitting",
           {propX <- with(immdef,1-xoyrs/progyrs)
           fit <- rpsftm(Surv(progyrs, prog)~rand(imm,propX), immdef, censor_time = censyrs,
                         low_psi=-1, hi_psi=1)
           
           f0 <- fit
           f1 <- update(fit, test=coxph)
           f2 <- update(fit, test=survreg, dist="weibull")
           f3 <- update(fit, test=survreg, dist="exponential")
           f4 <- update(fit, test=survreg, dist="loglogistic")
           f5 <- update(fit, test=survreg, dist="gaussian")
           f6 <- update(fit, test=survreg, dist="lognormal")
           
           
           
           
           fits <- list(f0,f1,f2,f3,f4,f5,f6)
             
             for( obj in fits){
               expect_s3_class(obj, class="rpsftm")
             }
             #lapply(fits, expect_s3_class, class="rpsftm")
           }
           )
## need to create some data for strata cluster, covariates.




##These may need to be specific to different fit, ie. adjustment is different for survdiff and coxph.
test_that("Check that a strata and cluster fits",
          {
            f0 <- rpsftm(Surv(progyrs, prog)~rand(imm,1-xoyrs/progyrs), immdef, censor_time = censyrs,
                          low_psi=-1, hi_psi=1
                #formula=~1
                         )
            immdef$category <- rep(c("A","B","C","D"),rep(250,4))
            immdef$covar <- rnorm(1000)
            immdef$clusterId <- rep(1:100,10)
            f0 <- update(f0, data=immdef)
            f0.strata <- update(f0,~.+strata(category))
            f1 <- update(f0, test=coxph)
            f1.All <- update(f1,~.+strata(category)+covar+cluster(clusterId))
            
            expect_s3_class(f0.strata, class="rpsftm")
            expect_s3_class(f1.All, class="rpsftm")
            })




test_that("subset argument check",
         {fit <- rpsftm(Surv(progyrs, prog)~rand(imm,1-xoyrs/progyrs),immdef, 
                        censor_time = censyrs, entry<1)
          expect_is(fit$psi, class="numeric")
         }
          
)

test_that("subset update check",
          {fit <- rpsftm(Surv(progyrs, prog)~rand(imm,1-xoyrs/progyrs),immdef, 
                         censor_time = censyrs, entry<1)
          fit <- update(fit, .~., subset=NULL)
          expect_is(fit$psi, class="numeric")
          }
          
)

test_that("updating of data argument",
          {
            fit <- rpsftm(Surv(progyrs, prog)~rand(imm,1-xoyrs/progyrs),subset(immdef, entry<1))
            fit <- update(fit, data= subset(immdef, entry>=1))
            expect_is(fit$psi, class="numeric")
          }
)


test_that("eval_z output",
          {
            fit <- rpsftm(Surv(progyrs, prog)~rand(imm,1-xoyrs/progyrs),
                          data=immdef, censor_time = censyrs, n_eval_z=40)
            expect_equal(dim(fit$eval_z)[1],40)
          }
)

test_that("check it works when arm=rx",
          {fit <- rpsftm(Surv(progyrs, prog)~rand(imm, imm), immdef, censor_time = censyrs)
          expect_is(fit$psi, class="numeric")
            }
          )

test_that("symbolic covariates",
{immdef$sqrent <-  with(immdef, sqrt(entry))
 fit1 <- rpsftm(Surv(progyrs,prog)~rand(imm,1-xoyrs/progyrs)+sqrent, 
       data=immdef, censor_time=censyrs, test=coxph)
 fit2 <- rpsftm(Surv(progyrs,prog)~rand(imm,1-xoyrs/progyrs)+sqrt(entry), 
              data=immdef, censor_time=censyrs, test=coxph)
 expect_equal(fit1$psi,fit2$psi)
}
)

test_that("symbolic covariates log transform",
{immdef$logentr <- with(immdef, log(entry+1))
fit1 <- rpsftm(Surv(progyrs,prog)~rand(imm,1-xoyrs/progyrs)+logentr, 
       data=immdef, censor_time=censyrs, test=coxph)
fit2 <- rpsftm(Surv(progyrs,prog)~rand(imm,1-xoyrs/progyrs)+log(entry+1), 
            data=immdef,censyrs, test=coxph)
expect_equal(fit1$psi, fit2$psi)
}
)


test_that("survfit",{
          fit0 <- rpsftm(Surv(progyrs,prog)~rand(imm,1-xoyrs/progyrs)+entry, 
                         data=immdef, censor_time=censyrs, test=coxph)
          fit1 <- rpsftm(Surv(progyrs,prog)~rand(imm,1-xoyrs/progyrs), 
                         data=immdef, censor_time=censyrs, test=survdiff)
          fit2 <- rpsftm(Surv(progyrs,prog)~rand(imm,1-xoyrs/progyrs)+entry, 
                         data=immdef, censor_time=censyrs, test=survreg)
          expect_s3_class(survfit(fit0), class="survfit")
          expect_error(survfit(fit1),"No applicable method")
          expect_error(survfit(fit2),"No applicable method")
          
          }
          
)

test_that("residual",{
  
  fit0 <- rpsftm(Surv(progyrs,prog)~rand(imm,1-xoyrs/progyrs)+entry, 
                 data=immdef, censor_time=censyrs, test=coxph)
  fit1 <- rpsftm(Surv(progyrs,prog)~rand(imm,1-xoyrs/progyrs)+entry, 
                 data=immdef, censor_time=censyrs, test=survreg)
  
  expect_is(residuals(fit0), class="numeric")
  expect_is(residuals(fit1, "dfbetas"), class="matrix")
  expect_s3_class(cox.zph(fit0), "cox.zph")
})


#CHECK that each line of code has been called somehow in this testing process??
#DONE:
#> #install.packages("covr")
#> library(covr)
#> cov <- package_coverage()
#> cov
#> zero_coverage(cov)



