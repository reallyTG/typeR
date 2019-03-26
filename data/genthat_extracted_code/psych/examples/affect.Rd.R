library(psych)


### Name: affect
### Title: Two data sets of affect and arousal scores as a function of
###   personality and movie conditions
### Aliases: affect maps flat
### Keywords: datasets

### ** Examples

data(affect)
describeBy(affect[-1],group="Film")
pairs.panels(affect[14:17],bg=c("red","black","white","blue")[affect$Film],pch=21,
    main="Affect varies by movies ")
errorCircles("EA2","TA2",data=affect,group="Film",labels=c("Sad","Fear","Neutral","Humor")
, main="Enegetic and Tense Arousal by Movie condition")
errorCircles(x="PA2",y="NA2",data=affect,group="Film",labels=c("Sad","Fear","Neutral","
Humor"),  main="Positive and Negative Affect by Movie condition")




