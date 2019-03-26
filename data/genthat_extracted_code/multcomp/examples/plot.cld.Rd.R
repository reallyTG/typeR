library(multcomp)


### Name: plot.cld
### Title: Plot a cld object
### Aliases: plot.cld
### Keywords: hplot

### ** Examples


  ### multiple comparison procedures
  ### set up a one-way ANOVA
  data(warpbreaks)
  amod <- aov(breaks ~ tension, data = warpbreaks)
  ### specify all pair-wise comparisons among levels of variable "tension"
  tuk <- glht(amod, linfct = mcp(tension = "Tukey"))
  ### extract information
  tuk.cld <- cld(tuk)
  ### use sufficiently large upper margin
  old.par <- par(mai=c(1,1,1.25,1), no.readonly=TRUE)
  ### plot
  plot(tuk.cld)
  par(old.par)

  ### now using covariates
  amod2 <- aov(breaks ~ tension + wool, data = warpbreaks)
  tuk2 <- glht(amod2, linfct = mcp(tension = "Tukey"))
  tuk.cld2 <- cld(tuk2)
  old.par <- par(mai=c(1,1,1.25,1), no.readonly=TRUE)
  ### use different colors for boxes
  plot(tuk.cld2, col=c("green", "red", "blue"))
  par(old.par)
  
  ### get confidence intervals
  ci.glht <- confint(tuk)
  ### plot them
  plot(ci.glht)
  old.par <- par(mai=c(1,1,1.25,1), no.readonly=TRUE)
  ### use 'confint.glht' object to plot all pair-wise comparisons
  plot(cld(ci.glht), col=c("white", "blue", "green"))
  par(old.par)
  
  ### set up all pair-wise comparisons for count data
  data(Titanic)
  mod <- glm(Survived ~ Class, data = as.data.frame(Titanic), 
             weights = Freq, family = binomial())
  ### specify all pair-wise comparisons among levels of variable "Class"
  glht.mod <- glht(mod, mcp(Class = "Tukey"))
  ### extract information
  mod.cld <- cld(glht.mod)
  ### use sufficiently large upper margin
  old.par <- par(mai=c(1,1,1.5,1), no.readonly=TRUE)
  ### plot
  plot(mod.cld)
  par(old.par)
  
  ### set up all pair-wise comparisons of a Cox-model
  if (require("survival") && require("MASS")) {
    ### construct 4 classes of age
    Melanoma$Cage <- factor(sapply(Melanoma$age, function(x){
                            if( x <= 25 ) return(1)
                            if( x > 25 & x <= 50 ) return(2)
                            if( x > 50 & x <= 75 ) return(3)
                            if( x > 75 & x <= 100) return(4) }
                           ))
    ### fit Cox-model
    cm <- coxph(Surv(time, status == 1) ~ Cage, data = Melanoma)
    ### specify all pair-wise comparisons among levels of "Cage"
    cm.glht <- glht(cm, mcp(Cage = "Tukey"))
    # extract information & plot
    old.par <- par(no.readonly=TRUE)
    ### use mono font family
    if (dev.interactive())
        old.par <- par(family = "mono")
    plot(cld(cm.glht), col=c("black", "red", "blue", "green"))
    par(old.par)
  }

  if (require("nlme") && require("lme4")) {
    data("ergoStool", package = "nlme")

    stool.lmer <- lmer(effort ~ Type + (1 | Subject),
                       data = ergoStool)
    glme41 <- glht(stool.lmer, mcp(Type = "Tukey"))

    old.par <- par(mai=c(1,1,1.5,1), no.readonly=TRUE)
    plot(cld(glme41))
    par(old.par)
  }



