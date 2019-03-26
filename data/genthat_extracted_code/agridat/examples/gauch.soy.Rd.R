library(agridat)


### Name: gauch.soy
### Title: Multi-environment trial of soybeans in New York, 1977 to 1988
### Aliases: gauch.soy

### ** Examples


data(gauch.soy)
dat <- gauch.soy

# AMMI biplot
if(require(agricolae)){
  # Figure 1 of Zobel et al 1988, means vs PC1 score
  dat2 <- droplevels(subset(dat, is.element(env, c("A77","C77","V77",
  "V78","A79","C79","G79","R79","V79","A80","C80","G80","L80","D80",
  "R80","V80","A81","C81","G81","L81","D81","R81","V81","A82","L82",
  "G82","V82","A83","I83","G83","A84","N84","C84","I84","G84"))))

  m2 <- with(dat2, AMMI(env, gen, rep, yield))
  bip <- m2$biplot
  with(bip, plot(yield, PC1, type='n', main="gauch.soy -- AMMI biplot"))
  with(bip, text(yield, PC1, rownames(bip),
                 col=ifelse(bip$type=="GEN", "darkgreen", "blue"),
                 cex=ifelse(bip$type=="GEN", 1.5, .75)))
}




