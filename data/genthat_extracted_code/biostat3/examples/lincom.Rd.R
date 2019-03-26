library(biostat3)


### Name: lincom
### Title: Linear combination of regression parameters.
### Aliases: lincom

### ** Examples

  fit <- glm(chd ~ hieng*job + offset(log(y)), data=diet, family=poisson)
  lincom(fit, c("hienghigh+hienghigh:jobconductor",
                "hienghigh+hienghigh:jobbank"),
         eform=TRUE)



