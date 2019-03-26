library(plotrix)


### Name: barNest
### Title: Display a nested breakdown of numeric values
### Aliases: barNest
### Keywords: misc

### ** Examples

 # recreate the Titanic data frame and show the three way breakdown
 titanic<-data.frame(
  class=c(rep("1st",325),rep("2nd",285),rep("3rd",706),rep("Crew",885)),
  age=c(rep("Adult",319),rep("Child",6),rep("Adult",261),rep("Child",24),
  rep("Adult",627),rep("Child",79),rep("Adult",885)),
  sex=c(rep("M",175),rep("F",144),rep("M",5),rep("F",1),
  rep("M",168),rep("F",93),rep("M",11),rep("F",13),
  rep("M",462),rep("F",165),rep("M",48),rep("F",31),
  rep("M",862),rep("F",23)),
  survived=c(rep("Yes",57),rep("No",118),rep("Yes",140),rep("No",4),rep("Yes",6),
  rep("Yes",14),rep("No",154),rep("Yes",80),rep("No",13),rep("Yes",24),
  rep("Yes",75),rep("No",387),rep("Yes",76),rep("No",89),
  rep("Yes",13),rep("No",35),rep("Yes",14),rep("No",17),
  rep("Yes",192),rep("No",670),rep("Yes",20),rep("No",3)))
 require(plotrix)
 titanic.colors<-list("gray90",c("#0000ff","#7700ee","#aa00cc","#dd00aa"),
  c("#ddcc00","#ee9900"),c("pink","lightblue"))
 barNest(survived~class+age+sex,titanic,col=titanic.colors,showall=TRUE,
  main="Titanic survival by class, age and sex",ylab="Proportion surviving",
  FUN=c("propbrk","binciWu","binciWl","valid.n"),shrink=0.15,trueval="Yes")
 barNest(survived~class+age+sex,titanic,col=titanic.colors,showall=TRUE,
  main="Titanic survival by class, age and sex (scaled bar widths)",
  ylab="Proportion surviving",FUN=c("propbrk","binciWu","binciWl","valid.n"),
  shrink=0.15,trueval="Yes",Nwidths=TRUE)
 # now show the actual numbers of passengers
 barNest(survived~class+age+sex,titanic,col=titanic.colors,showall=TRUE,
  main="Titanic passengers and crew by class, age and sex",
  ylab="Number",FUN="valid.n",shrink=0.15)
 # to see this properly displayed, start a wide plot window
 # x11(width=10)
 test.df<-data.frame(Age=rnorm(100,35,10),
  Sex=sample(c("Male","Female"),100,TRUE),
  Marital=sample(c("Div","Mar","Sing","Wid"),100,TRUE),
  Employ=sample(c("FT","PT","Un"),100,TRUE))
 test.col<-list(Overall="gray",Sex=c("pink","lightblue"),
  Marital=c("mediumpurple","orange","tan","lightgreen"),
  Employ=c("#1affd8","#caeecc","#ff90d0"))
 barNest(formula=Age~Sex+Marital+Employ,data=test.df,ylab="Mean age (years)",
  main="Mean age by subgroups",errbars=TRUE,col=test.col)
 barNest(formula=Age~Sex+Marital+Employ,data=test.df,ylab="Mean age (years)",
  main="Mean age by subgroups (widths scaled to Ns)",errbars=TRUE,col=test.col,
  Nwidths=TRUE)
 # set up functions for 20th and 80th percentiles
 q20<-function(x,na.rm=TRUE) return(quantile(x,probs=0.2,na.rm=TRUE))
 q80<-function(x,na.rm=TRUE) return(quantile(x,probs=0.8,na.rm=TRUE))
 # show the asymmetric dispersion measures
 barNest(formula=Age~Sex+Marital+Employ,data=test.df,ylab="Mean age (years)",
  main="Use median and quantiles for dispersion",
  FUN=c("median","q80","q20","valid.n"),
  errbars=TRUE,col=test.col)
 barNest(formula=Employ~Sex+Marital,data=test.df,ylab="Proportion unemployed",
  main="Proportion unemployed by sex and marital status",
  FUN=c("propbrk","binciWu","binciWl","valid.n"),
  errbars=TRUE,col=test.col,trueval="Un")
 barNest(formula=Employ~Sex+Marital,data=test.df,ylab="Proportion unemployed",
  main="Proportion unemployed by sex and marital status (scaled bar widths)",
  FUN=c("propbrk","binciWu","binciWl","valid.n"),
  errbars=TRUE,col=test.col,trueval="Un",Nwidths=TRUE)
 barNest(formula=Age~Sex+Marital+Employ,data=test.df,ylab="Counts",
  main="Show the counts in subgroups (final level only)",FUN="valid.n",
  col=test.col,showall=FALSE,ylim=c(0,10))
 barNest(formula=Age~Sex+Marital+Employ,data=test.df,ylab="Counts",
  main="Show all the counts in subgroups",FUN="valid.n",mar=c(5,5,4,2),
  col=test.col)
 


