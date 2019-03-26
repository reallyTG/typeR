library(psych)


### Name: error.bars.by
### Title: Plot means and confidence intervals for multiple groups
### Aliases: error.bars.by
### Keywords: multivariate hplot

### ** Examples


data(sat.act)
#The generic plot of variables by group
error.bars.by( SATV + SATQ ~ gender,data=sat.act)  #formula input 
error.bars.by(SATV + SATQ ~ education + gender, data =sat.act)
error.bars.by(sat.act[1:4],sat.act$gender,legend=7) #specification of variables

#a bar plot
error.bars.by(sat.act[5:6],sat.act$gender,bars=TRUE,labels=c("male","female"),
    main="SAT V and SAT Q by gender",ylim=c(0,800),colors=c("red","blue"),
    legend=5,v.labels=c("SATV","SATQ"))  #draw a barplot
#a bar plot of SAT by age -- not recommended, see the next plot
error.bars.by(SATV + SATQ ~ education,data=sat.act,bars=TRUE,xlab="Education",
   main="95 percent confidence limits of Sat V and Sat Q", ylim=c(0,800),
   v.labels=c("SATV","SATQ"),colors=c("red","blue") )
#a better graph uses points not bars
#use formulat input
  #plot SAT V and SAT Q by education
error.bars.by(SATV + SATQ ~ education,data=sat.act,TRUE, xlab="Education",
    legend=5,labels=colnames(sat.act[5:6]),ylim=c(525,700),
     main="self reported SAT scores by education")
#make the cats eyes semi-transparent by specifying a negative density

error.bars.by(SATV + SATQ ~ education,data=sat.act, xlab="Education",
    legend=5,labels=c("SATV","SATQ"),ylim=c(525,700),
     main="self reported SAT scores by education",density=-10)

#now for a more complicated examples using 25 big 5 items scored into 5 scales
#and showing age trends by decade 
#this shows how to convert many levels of a grouping variable (age) into more manageable levels.
data(bfi)   #The Big 5 data
#first create the keys 
 keys.list <- list(Agree=c(-1,2:5),Conscientious=c(6:8,-9,-10),
        Extraversion=c(-11,-12,13:15),Neuroticism=c(16:20),Openness = c(21,-22,23,24,-25))
 keys <- make.keys(bfi,keys.list)
 #then create the scores for those older than 10 and less than 80
 bfis <- subset(bfi,((bfi$age > 10) & (bfi$age < 80)))

 scores <- scoreItems(keys,bfis,min=1,max=6) #set the right limits for item reversals
 #now draw the results by age
 
 error.bars.by(scores$scores,round(bfis$age/10)*10,by.var=TRUE,
      main="BFI age trends",legend=3,labels=colnames(scores$scores),
        xlab="Age",ylab="Mean item score")

 error.bars.by(scores$scores,round(bfis$age/10)*10,by.var=TRUE,
      main="BFI age trends",legend=3,labels=colnames(scores$scores),
        xlab="Age",ylab="Mean item score",density=-10)



