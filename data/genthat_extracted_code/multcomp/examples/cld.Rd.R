library(multcomp)


### Name: cld
### Title: Set up a compact letter display of all pair-wise comparisons
### Aliases: cld cld.glht cld.summary.glht cld.confint.glht

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
  old.par <- par(mai=c(1,1,1.25,1), no.readonly = TRUE)
  ### plot
  plot(tuk.cld)
  par(old.par)
  
  ### now using covariates
  data(warpbreaks)
  amod2 <- aov(breaks ~ tension + wool, data = warpbreaks)
  ### specify all pair-wise comparisons among levels of variable "tension"
  tuk2 <- glht(amod2, linfct = mcp(tension = "Tukey"))
  ### extract information
  tuk.cld2 <- cld(tuk2)
  ### use sufficiently large upper margin
  old.par <- par(mai=c(1,1,1.25,1), no.readonly = TRUE)
  ### plot using different colors
  plot(tuk.cld2, col=c("black", "red", "blue"))
  par(old.par)

  ### set up all pair-wise comparisons for count data
  data(Titanic)
  mod <- glm(Survived ~ Class, data = as.data.frame(Titanic), weights = Freq, family = binomial())
  ### specify all pair-wise comparisons among levels of variable "Class"
  glht.mod <- glht(mod, mcp(Class = "Tukey"))
  ### extract information
  mod.cld <- cld(glht.mod)
  ### use sufficiently large upper margin
  old.par <- par(mai=c(1,1,1.5,1), no.readonly = TRUE)
  ### plot
  plot(mod.cld)
  par(old.par)



