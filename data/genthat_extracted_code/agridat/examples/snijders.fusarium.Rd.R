library(agridat)


### Name: snijders.fusarium
### Title: Fusarium infection in wheat varieties
### Aliases: snijders.fusarium
### Keywords: datasets

### ** Examples


data(snijders.fusarium)
dat <- snijders.fusarium

aggregate(y ~ strain + year, dat, FUN=mean) # Match means in Snijders table 1

dat <- transform(dat, y=y/100, year=factor(year), yrstr=factor(paste0(year,"-",strain)))

# Strain F329 shows little variation across years. F39 shows a lot.
require(lattice)
dotplot(gen~y|strain, data=dat, group=year,
        main="snijders.fusarium : infection by strain",
        xlab="Fraction infected", ylab="variety",
        auto.key=list(columns=3))

# Logit transform
dat <- transform(dat, logit=log(y/(1-y)))
m1 <- aov(logit ~ yrstr + gen, data=dat) # Match SS in VanEeuwijk table 4
anova(m1)  # Match SS in VanEeuwijk table 4
m2 <- aov(logit ~ year*strain + gen + gen:year + gen:strain, data=dat)
anova(m2) # Match to VanEeuwijk table 5

## Not run: 
##D 
##D # GLM on untransformed data using logit link, variance mu^2(1-mu)^2
##D require(gnm) # for 'wedderburn' family
##D m2 <- glm(y ~ yrstr + gen, data=dat, family="wedderburn")
##D anova(m2) # Main effects match VanEeuwijk table 6
##D 
##D # Generalized AMMI-2 model. Matches VanEeuwijk table 6
##D bilin2 <- gnm(y ~ yrstr + gen + instances(Mult(yrstr, gen), 2),
##D               data=dat, family = wedderburn)
##D # plot(bilin2,1) # Resid vs fitted plot matches VanEeuwijk figure 3c
##D ## anova(bilin2)
##D ##                            Df Deviance Resid. Df Resid. Dev
##D ## NULL                                         203     369.44
##D ## yrstr                      11  150.847       192     218.60
##D ## gen                        16  145.266       176      73.33
##D ## Mult(yrstr, gen, inst = 1) 26   26.128       150      47.20
##D ## Mult(yrstr, gen, inst = 2) 24   19.485       126      27.72
##D 
##D # Manually extract coordinates for biplot
##D cof <- coef(bilin2)
##D y1 <- cof[29:40]
##D g1 <- cof[41:57]
##D y2 <- cof[58:69]
##D g2 <- cof[70:86]
##D g12 <- cbind(g1,g2)
##D rownames(g12) <- substring(rownames(g12), 29)
##D y12 <- cbind(y1,y2)
##D rownames(y12) <- substring(rownames(y12), 31)
##D g12[,1] <- -1 * g12[,1]
##D y12[,1] <- -1 * y12[,1]
##D # GAMMI biplot.  Inner-products of points projected onto
##D # arrows match VanEeuwijk figure 4.  Slight rotation of graph is ignorable.
##D biplot(y12, g12, cex=.75, main="snijders.fusarium") # Arrows to genotypes.
##D 
## End(Not run)




