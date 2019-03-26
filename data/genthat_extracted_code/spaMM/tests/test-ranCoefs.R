if (file.exists((privdata <- "C:/home/francois/travail/stats/spaMMplus/spaMM/package/tests_private/all_fitness.txt"))) {
  cat("\ntest ranCoefs:")
  my.data <- read.table(privdata, header = TRUE, sep = "\t",dec = ".")
  my.data$line <- factor(as.character(my.data$line))
  my.data <- na.omit(my.data)
  if (TRUE || spaMM.getOption("example_maxtime")>2.5) {
    # -1559.813 1.8s v 2.4.146
    (fitme3 <- fitme(total_red ~ sex*env + (1|rep) + (0 + env|line),
                     data = my.data, method="ML"))
    # final precision depends on two steps ! And ultimately on HLfit/hatval precision in the refit
    try(testthat::expect_equal(attr(attr(fitme3,"optimInfo")$optim.pars,"optr")$objective,1559.8129563,tol=1e-8)) ## invL augZXy better !
    try(testthat::expect_equal(logLik(fitme3)[[1L]],-1559.8127743,tol=1e-8)) ## -1559.812644... by invL
    #
    # check effect of changing contrasts for factors between fit and predict: 
    p1 <- predict(fitme3)[2]
    # options(contrasts=c("contr.treatment", 'contr.poly'))
    p2 <- predict(fitme3,newdata=my.data[2,])[1]
    oldopt <- options(contrasts=c("contr.poly", 'contr.treatment'))
    p3 <- predict(fitme3,newdata=my.data[2,])[1]
    options(oldopt)
    testthat::expect_true(diff(range(c(p1,p2,p3)))<1e-8) 
    #
  }
  if (spaMM.getOption("example_maxtime")>69) {
    # -1559.815 # 3.6 s v 2.4.146
    (HLfit3 <- HLfit(total_red ~ sex*env + (1|rep) + (0 + env|line),
                     data = my.data, HLmethod="ML"))
    testthat::expect_equal(logLik(HLfit3)[[1L]],-1559.814716,tol=1e-8)
    #  -1536.081 24.9s v 2.4.146
    (fitme6 <- fitme(total_red ~ sex*env + (1|rep) + (0 + sex:env|line),
                     data = my.data, method="ML"))  
    testthat::expect_equal(attr(attr(fitme6,"optimInfo")$optim.pars,"optr")$objective,1536.08100566145,tol=1e-8)
    testthat::expect_equal(logLik(fitme6)[[1L]],-1536.08085189,tol=1e-8) ## -1536.080818 is quite possible
    #  -1536.083 37.9 v 2.4.146 
    (HLfit6 <- HLfit(total_red ~ sex*env + (1|rep) + (0 + sex:env|line),
                     data = my.data, HLmethod="ML"))
    testthat::expect_equal(logLik(HLfit6)[[1L]],-1536.083037,tol=1e-8) ## -1536.082771 with triangularL
  }
}

