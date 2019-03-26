library(processR)


### Name: conceptDiagram2
### Title: Make concept Diagram
### Aliases: conceptDiagram2

### ** Examples

labels=list(X="Time Spent in\n Grad School", M="# of\n Publications", Y="# of Job Offers")
conceptDiagram2(xb=TRUE,labels=labels)
moderator=list(name="Z1",label="Time Spent\n with Alex",pos=3,
    site=list(c("a","b","c")),latent=FALSE)
conceptDiagram2(moderator=moderator,labels=labels)
moderator=list(name=c("Z1","Z2"),label=c("Time Spent\n with Alex","Z2label"),pos=c(3,3),
    site=list(c("a","b","c"),c("b","c")),latent=c(FALSE,FALSE))
conceptDiagram2(moderator=moderator,labels=labels,yinterval=0.4)
covar=list(name=c("C1","C2"),label=c("sex","tenure"),site=list(c("Y"),c("Y")))
conceptDiagram2(M=NULL,moderator=list(name="M",pos=4,site=list("c"),latent=FALSE),covar=covar)
conceptDiagram2(covar=covar)



