library(intubate)


### Name: plotrix
### Title: Interfaces for plotrix package for data science pipelines.
### Aliases: ntbt_barNest ntbt_brkdn.plot ntbt_brkdnNest ntbt_histStack
###   ntbt_plotH
### Keywords: intubate magrittr plotrix barNest brkdn.plot brkdnNest
###   histStack plotH

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(plotrix)
##D 
##D ## ntbt_barNest: Display a nested breakdown of numeric values
##D titanic<-data.frame(
##D   class=c(rep("1st",325),rep("2nd",285),rep("3rd",706),rep("Crew",885)),
##D   age=c(rep("Adult",319),rep("Child",6),rep("Adult",261),rep("Child",24),
##D         rep("Adult",627),rep("Child",79),rep("Adult",885)),
##D   sex=c(rep("M",175),rep("F",144),rep("M",5),rep("F",1),
##D         rep("M",168),rep("F",93),rep("M",11),rep("F",13),
##D         rep("M",462),rep("F",165),rep("M",48),rep("F",31),
##D         rep("M",862),rep("F",23)),
##D   survived=c(rep("Yes",57),rep("No",118),rep("Yes",140),rep("No",4),rep("Yes",6),
##D              rep("Yes",14),rep("No",154),rep("Yes",80),rep("No",13),rep("Yes",24),
##D              rep("Yes",75),rep("No",387),rep("Yes",76),rep("No",89),
##D              rep("Yes",13),rep("No",35),rep("Yes",14),rep("No",17),
##D              rep("Yes",192),rep("No",670),rep("Yes",20),rep("No",3)))
##D titanic.colors<-list("gray90",c("#0000ff","#7700ee","#aa00cc","#dd00aa"),
##D                      c("#ddcc00","#ee9900"),c("pink","lightblue"))
##D 
##D ## Original function to interface
##D barNest(survived ~ class + age + sex, titanic, col = titanic.colors,
##D         showall = TRUE, main = "Titanic survival by class, age and sex",
##D         ylab = "Proportion surviving", FUN = c("propbrk","binciWu","binciWl","valid.n"),
##D         shrink = 0.15, trueval = "Yes")
##D 
##D ## The interface puts data as first parameter
##D ntbt_barNest(titanic, survived ~ class + age + sex, col = titanic.colors,
##D              showall = TRUE, main = "Titanic survival by class, age and sex",
##D              ylab = "Proportion surviving", FUN = c("propbrk","binciWu","binciWl","valid.n"),
##D              shrink = 0.15, trueval = "Yes")
##D 
##D ## so it can be used easily in a pipeline.
##D titanic %>%
##D   ntbt_barNest(survived ~ class + age + sex, col = titanic.colors,
##D                showall = TRUE, main = "Titanic survival by class, age and sex",
##D                ylab = "Proportion surviving", FUN = c("propbrk","binciWu","binciWl","valid.n"),
##D                shrink = 0.15, trueval = "Yes")
##D 
##D 
##D ## ntbt_brkdn.plot: A point/line plotting routine
##D test.df<-data.frame(a=rnorm(80)+4,b=rnorm(80)+4,c=rep(LETTERS[1:4],each=20),
##D                     d=rep(rep(letters[1:4],each=4),5))
##D ## Original function to interface
##D brkdn.plot("a", "c", "d", test.df, pch = 1:4, col = 1:4)
##D 
##D ## The interface puts data as first parameter
##D ntbt_brkdn.plot(test.df, "a", "c", "d", pch = 1:4, col = 1:4)
##D 
##D ## so it can be used easily in a pipeline.
##D test.df %>%
##D   ntbt_brkdn.plot("a", "c", "d", pch = 1:4, col = 1:4)
##D 
##D 
##D ## ntbt_brkdnNest: Perform a nested breakdown of numeric values
##D brkdntest <- data.frame(Age=rnorm(100,25,10),
##D                         Sex=sample(c("M","F"),100,TRUE),
##D                         Marital=sample(c("M","X","S","W"),100,TRUE),
##D                         Employ=sample(c("FT","PT","NO"),100,TRUE))
##D ## Original function to interface
##D brkdnNest(Age ~ Sex + Marital + Employ, data = brkdntest)
##D 
##D ## The interface puts data as first parameter
##D ntbt_brkdnNest(brkdntest, Age ~ Sex + Marital + Employ)
##D 
##D ## so it can be used easily in a pipeline.
##D brkdntest %>%
##D   ntbt_brkdnNest(Age ~ Sex + Marital + Employ)
##D 
##D 
##D ## ntbt_histStack: Histogram "stacked" by categories
##D set.seed(409)
##D df <- data.frame(len=rnorm(100)+5,
##D                  grp=sample(c("A","B","C","D"),100,replace=TRUE))
##D 
##D ## Original function to interface
##D histStack(len ~ grp, data = df, main = "Default (rainbow) colors",
##D           xlab = "Length category")
##D 
##D ## The interface puts data as first parameter
##D ntbt_histStack(df, len ~ grp, main = "Default (rainbow) colors",
##D                xlab = "Length category")
##D 
##D ## so it can be used easily in a pipeline.
##D df %>%
##D   ntbt_histStack(len ~ grp, main = "Default (rainbow) colors",
##D                  xlab = "Length category")
##D 
##D 
##D ## ntbt_plotH: Scatterplot with histogram-like bars
##D d <- data.frame(x=c(1,5,10:20),y=runif(13)+1,
##D                 g=factor(sample(c("A","B","C"),13,replace=TRUE)))
##D 
##D ## Original function to interface
##D plotH(y ~ x, data = d)
##D 
##D ## The interface puts data as first parameter
##D ntbt_plotH(d, y ~ x)
##D 
##D ## so it can be used easily in a pipeline.
##D d %>%
##D   ntbt_plotH(y ~ x)
## End(Not run)



