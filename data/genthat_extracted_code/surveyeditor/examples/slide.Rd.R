library(surveyeditor)


### Name: slide
### Title: Survey/questionnaire slides
### Aliases: slide

### ** Examples

## Not run: 
##D slide(id=1234,type=1,title="Question 1",content=c("Testing1","Testing2"),
##D h=c(0,0),v=c(100,80),size=c(3,2),col=c("blue","pink"),time=4,Line.draw=c("abline
##D (h=seq(0,100,50),col='red',lty=4)","abline(v=seq(0,100,100),col='green')"))
## End(Not run)
## Not run: 
##D slide(id=1234,type=2,title="Instructions",content=c("* Please give 
##D genuine response according to your belief.","* Any part of the survey is 
##D irreversible meaning that you cannot change the\n response you give in the previous 
##D slide.","* Once you click on any green button you proceed to the next slide."),
##D h=c(0,0,0),v=c(80,70,55),size=c(2,2,2),col=c("black","black","black"))
## End(Not run)
## Not run: 
##D slide(id=1234,type=3,title="Question 2",content="What is the average 
##D score of all groups?",h=0,v=100,size=2,col="black",box.level=c(70,100),Extra=list
##D (list(date=c(rep("Boys-Pass",6),rep("Girls-Pass",4),rep("Boys-Fail",4),
##D rep("Girls-Fail",2)),type="h1",loc=c(10,30,40,60),ticks=list(seq(0,6,1)),
##D xlabl="Grades",ylabl="Number\nof\nass\n& fail",title="Grade distribution",
##D col=c(rep("skyblue",2),rep("red",2))),list(Table=matrix(c(rep(c("M","F"),2),
##D round(rnorm(4,100,10),2),rep("Test A",2),rep("Test B",2)),ncol=4,byrow=T,
##D dimnames=list(c("Gender","Average\nScore","Test\ntype"),paste("Group",1:4))),
##D size=c(1.5,1.5,2),type="t",loc=c(55,30,90,60))))
## End(Not run)
## Not run: 
##D slide(id=123,type=4,title="Question 3",content=c("What do you think 
##D the return on the 2015-May-21 will be?","Please choose one of the followings"),
##D h=c(0,0),v=c(90,80),size=c(2,1.5),col=c("black","blue"),choices=c("Goes down",
##D "Remains the same","Goes up"),layout=c(1,3),box.level=75,n.select=1,
##D Extra=list(list(Date=paste("2015-May-",1:20,sep=""),return=rnorm(20),type="b",
##D loc=c(20,10,80,50),ticks=list(c(seq(0,20,5)),c(seq(-2,3,1))),ylabl="Return",
##D title="Daily return")))
## End(Not run)
## Not run: 
##D slide(id=123,type=5,title="Question 4",content=c("The market price is 
##D $","(0 refers to 'Strongly disagree' ... 5 refers to 'Strongly agree')"),
##D h=c(0,0),v=c(80,70),size=c(2,1.5),col=c("black","orange"),cond=seq(10,12,0.5),
##D scale=seq(0,5,0.5),box.level=50)
## End(Not run)
## Not run: 
##D slide(id=123,type=6,title="Question 5",content="Within which two numbers
##D  do you think the return on the 2015-May-21 will fall into?",h=0,v=100,size=2,
##D col="black",range=seq(-3,3,1),grid=5,unit="%",box.level=85,n.select=2,Extra=
##D list(list(Date=paste("2015-May-",1:20,sep=""),return=rnorm(20),type="b",loc=
##D c(20,10,80,45),ticks=list(c(seq(0,20,5)),c(seq(-2,3,1))),ylabl="Return",title=
##D "Daily return")))
## End(Not run)
## Not run: 
##D slide(id=123,type=7,title="Question 6",content="Would you take the milk 
##D if it costs $",h=0,v=80,size=2,col="black",initial=3,increment=1,order="descending"
##D ,box.level=70)
## End(Not run)



