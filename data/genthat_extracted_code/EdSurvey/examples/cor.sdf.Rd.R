library(EdSurvey)


### Name: cor.sdf
### Title: Bivariate Correlation
### Aliases: cor.sdf

### ** Examples

## Not run: 
##D # read in the example data (generated, not real student data)
##D sdf <- readNAEP(system.file("extdata/data", "M36NT2PM.dat", package = "NAEPprimer"))
##D 
##D # for two categorical variables any of the following work
##D c1_pears <- cor.sdf(x="b017451", y="b003501", data=sdf, method="Pearson",
##D                     weightVar="origwt")
##D c1_spear <- cor.sdf(x="b017451", y="b003501", data=sdf, method="Spearman",
##D                     weightVar="origwt")
##D c1_polyc <- cor.sdf(x="b017451", y="b003501", data=sdf, method="Polychoric",
##D                     weightVar="origwt")
##D 
##D c1_pears
##D c1_spear
##D c1_polyc
##D 
##D # for categorical variables, users can either keep the original numeric levels of the variables
##D # or condense the levels (default)
##D # The following call condenses the levels of the variable 'c046501'
##D cor.sdf(x="c046501", y="c044006", data=sdf)
##D 
##D # The following call keeps the original levels of the variable 'c046501'
##D cor.sdf(x="c046501", y="c044006", data=sdf, condenseLevels = FALSE)
##D 
##D # these take awhile to calculate for large datasets, so limit to a subset
##D sdf_dnf <- subset(sdf, b003601 == 1)
##D 
##D # for a categorical variable and a scale score any of the following work
##D c2_pears <- cor.sdf(x="composite", y="b017451", data=sdf_dnf, method="Pearson",
##D                     weightVar="origwt")
##D c2_spear <- cor.sdf(x="composite", y="b017451", data=sdf_dnf, method="Spearman",
##D                     weightVar="origwt")
##D c2_polys <- cor.sdf(x="composite", y="b017451", data=sdf_dnf, method="Polyserial",
##D                     weightVar="origwt")
##D 
##D c2_pears
##D c2_spear
##D c2_polys
##D 
##D # recode two variables
##D cor.sdf(x="c046501", y="c044006", data=sdf, method="Spearman", weightVar="origwt",
##D         recode=list(c046501=list(from="0%",to="None"),
##D                     c046501=list(from=c("1-5%", "6-10%", "11-25%", "26-50%",
##D                                         "51-75%", "76-90%", "Over 90%"),
##D                                  to="Between 0% and 100%"),
##D                     c044006=list(from=c("1-5%", "6-10%", "11-25%", "26-50%",
##D                                         "51-75%", "76-90%", "Over 90%"),
##D                                  to="Between 0% and 100%")))
##D 
##D # reorder two variables
##D cor.sdf(x="b017451", y="sdracem", data=sdf, method="Spearman", weightVar="origwt", 
##D         reorder=list(sdracem=c("White", "Hispanic", "Black", "Asian/Pacific Island",
##D                                "Amer Ind/Alaska Natv", "Other"),
##D                      b017451=c("Every day", "2 or 3 times a week", "About once a week",
##D                                "Once every few weeks", "Never or hardly ever")))
##D 
##D # recode two variables and reorder
##D cor.sdf(x="pared", y="b013801", data=subset(sdf, !pared %in% "I Don\'t Know"),
##D         method="Spearman", weightVar = "origwt",
##D         recode=list(pared=list(from="Some ed after H.S.", to="Graduated H.S."), 
##D                     pared=list(from="Graduated college", to="Graduated H.S."),
##D                     b013801=list(from="0-10", to="Less than 100"), 
##D                     b013801=list(from="11-25", to="Less than 100"),
##D                     b013801=list(from="26-100", to="Less than 100")),
##D         reorder=list(b013801=c("Less than 100", ">100")))
## End(Not run)



