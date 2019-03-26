library(broom)


### Name: tidy.boot
### Title: Tidy a(n) boot object
### Aliases: tidy.boot boot_tidiers

### ** Examples

if (require("boot")) {
   clotting <- data.frame(
          u = c(5,10,15,20,30,40,60,80,100),
          lot1 = c(118,58,42,35,27,25,21,19,18),
          lot2 = c(69,35,26,21,18,16,13,12,12))

   g1 <- glm(lot2 ~ log(u), data = clotting, family = Gamma)

   bootfun <- function(d, i) {
      coef(update(g1, data= d[i,]))
   }
   bootres <- boot(clotting, bootfun, R = 999)
   tidy(g1, conf.int=TRUE)
   tidy(bootres, conf.int=TRUE)
}




