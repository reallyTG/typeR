library(BioStatR)


### Name: gg_qqplot
### Title: Graphique des quantiles (qqplot) et droite interquartile
### Aliases: gg_qqplot
### Keywords: univar

### ** Examples

glycine.blanche<-subset(Mesures,subset=(Mesures$espece=="glycine blanche"))
gg_qqplot(glycine.blanche,"taille")

#bonus ajustement avec une autre loi (ici Student (car dist = qt) dont on estime les ddl)
lauriers.roses<-subset(Mesures,subset=(Mesures$espece=="laurier rose"))
shapiro.test(lauriers.roses$taille) 
#pas issu d'une loi normale au risque alpha=5%
gg_qqplot(lauriers.roses,"taille")
gg_qqplot(lauriers.roses,"taille",qq.line=FALSE)
#essayons un qqplot avec une loi de Student
## Not run: 
##D require(MASS)
##D params <- as.list(fitdistr(lauriers.roses$taille, "t")$estimate)
##D #avec la droite
##D gg_qqplot(lauriers.roses,"taille",qt,params)
##D #essayons un qqplot avec une loi gamma
##D params <- as.list(fitdistr(lauriers.roses$taille,"gamma")$estimate)
##D #avec la droite
##D gg_qqplot(lauriers.roses,"taille",qgamma,params)
##D #essayons un qqplot avec une loi du chi-deux
##D params <- list(df=fitdistr(lauriers.roses$taille,"chi-squared",start=list(df=5),
##D method="Brent",lower=1,upper=40)$estimate)
##D #avec la droite
##D gg_qqplot(lauriers.roses,"taille",qchisq,params)
## End(Not run)



