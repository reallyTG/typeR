if (file.exists((privdata <- "C:/home/francois/travail/stats/spaMMplus/spaMM/package/tests_private/all_fitness.txt"))) {
  cat("test aug_ZXy:\n")
  my.data <- read.table(privdata, header = TRUE, sep = "\t",dec = ".")
  my.data$line <- factor(as.character(my.data$line))
  my.data <- na.omit(my.data)
  
  # Minimal example (small matrices) for testing ranCoefs code in general: 
  set.seed(666)
  perm <- sample(nrow(my.data))
  if (exists(".HLfit_body_augZXy_invL",envir = asNamespace("spaMM"))) { # atually spprec case...
    oldopt <- spaMM.options(augZXy_fitfn=".HLfit_body_augZXy_invL", check_alt_augZXy=FALSE) # F I X_invL no check_alt_augZXy bc it fails. But the final logLik is checked
    (mini_rC <- fitme(total_red ~ 1 + (sex|env), data = my.data[perm[1:20],], method="ML"))
    spaMM.options(oldopt)
  }
  
  # Plus an augZXy test (not ranCoefs):
  vanilla <- fitme(total_red ~ sex*env + (1|rep) + (1|line), data = my.data, method="ML")
  if (exists(".HLfit_body_augZXy_W",envir = asNamespace("spaMM"))) {
    oldopt <- spaMM.options(augZXy_fitfn=".HLfit_body_augZXy_W", check_alt_augZXy=TRUE) 
    essainola <- fitme(total_red ~ sex*env + (1|rep) + (1|line), data = my.data, method="ML")
    spaMM.options(oldopt)
    testthat::expect_true((diff(range(logLik(vanilla),logLik(essainola)))<1e-8)) 
  }
  if (exists(".HLfit_body_augZXy_invL",envir = asNamespace("spaMM"))) {
    oldopt <- spaMM.options(augZXy_fitfn=".HLfit_body_augZXy_invL", check_alt_augZXy=TRUE)
    essainola <- fitme(total_red ~ sex*env + (1|rep) + (1|line), data = my.data, method="ML")
    spaMM.options(oldopt)
    testthat::expect_true((diff(range(logLik(vanilla),logLik(essainola)))<1e-8)) 
  }
}
