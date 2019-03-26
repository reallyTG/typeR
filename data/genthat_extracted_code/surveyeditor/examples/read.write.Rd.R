library(surveyeditor)


### Name: read.write
### Title: Dynamic survey data storage function
### Aliases: read.write

### ** Examples

## Not run: link<-"R:/test.txt"
## Not run: id<-identity("auto",link=link)
## Not run: 
##D Q1<-slide(id=id,type=7,title="Question 1",content="Would you take the milk if 
##D it costs $",h=0,v=80,size=2,col="black",initial=3,increment=1,order="descending"
##D ,box.level=70)
## End(Not run)
## Not run: 
##D Q2<-slide(id=id,type=5,title="Question 2",content=c("The market price is $"
##D ,"(0 refers to 'Strongly disagree' ... 5 refers to 'Strongly agree')"),h=c(0,0)
##D ,v=c(80,70),size=c(2,1.5),col=c("black","orange"),cond=seq(10,12,0.5),scale=seq(0,5,0.5)
##D ,box.level=50)
## End(Not run)
## Not run: 
##D read.write(rbind(Q1,Q2),link=link) #rbind is used to form a bundled 
##D matrix-type responses
## End(Not run)




