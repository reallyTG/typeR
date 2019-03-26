library(multcomp)


### Name: glht
### Title: General Linear Hypotheses
### Aliases: glht glht.matrix glht.character glht.expression glht.mcp
###   glht.mlf mcp
### Keywords: htest

### ** Examples


  ### multiple linear model, swiss data
  lmod <- lm(Fertility ~ ., data = swiss)

  ### test of H_0: all regression coefficients are zero 
  ### (ignore intercept)

  ### define coefficients of linear function directly
  K <- diag(length(coef(lmod)))[-1,]
  rownames(K) <- names(coef(lmod))[-1]
  K

  ### set up general linear hypothesis
  glht(lmod, linfct = K)

  ### alternatively, use a symbolic description 
  ### instead of a matrix 
  glht(lmod, linfct = c("Agriculture = 0",
                        "Examination = 0",
                        "Education = 0",
                        "Catholic = 0",
                        "Infant.Mortality = 0"))


  ### multiple comparison procedures
  ### set up a one-way ANOVA
  amod <- aov(breaks ~ tension, data = warpbreaks)

  ### set up all-pair comparisons for factor `tension'
  ### using a symbolic description (`type' argument 
  ### to `contrMat()')
  glht(amod, linfct = mcp(tension = "Tukey"))

  ### alternatively, describe differences symbolically
  glht(amod, linfct = mcp(tension = c("M - L = 0", 
                                      "H - L = 0",
                                      "H - M = 0")))

  ### alternatively, define contrast matrix directly
  contr <- rbind("M - L" = c(-1, 1, 0),
                 "H - L" = c(-1, 0, 1), 
                 "H - M" = c(0, -1, 1))
  glht(amod, linfct = mcp(tension = contr))

  ### alternatively, define linear function for coef(amod)
  ### instead of contrasts for `tension'
  ### (take model contrasts and intercept into account)
  glht(amod, linfct = cbind(0, contr %*% contr.treatment(3)))


  ### mix of one- and two-sided alternatives
  warpbreaks.aov <- aov(breaks ~ wool + tension,
                      data = warpbreaks)

  ### contrasts for `tension'
  K <- rbind("L - M" = c( 1, -1,  0),     
             "M - L" = c(-1,  1,  0),       
             "L - H" = c( 1,  0, -1),     
             "M - H" = c( 0,  1, -1))

  warpbreaks.mc <- glht(warpbreaks.aov, 
                        linfct = mcp(tension = K),
                        alternative = "less")

  ### correlation of first two tests is -1
  cov2cor(vcov(warpbreaks.mc))

  ### use smallest of the two one-sided
  ### p-value as two-sided p-value -> 0.0232
  summary(warpbreaks.mc)




