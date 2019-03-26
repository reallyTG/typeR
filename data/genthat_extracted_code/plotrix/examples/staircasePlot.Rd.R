library(plotrix)


### Name: staircasePlot
### Title: Display a staircase plot
### Aliases: staircasePlot
### Keywords: misc

### ** Examples

 sample_size<-c(500,-72,428,-94,334,-45,289)
 totals<-c(TRUE,FALSE,TRUE,FALSE,TRUE,FALSE,TRUE)
 labels<-c("Contact list","Uncontactable","","Declined","","Ineligible",
  "Final sample")
 staircasePlot(sample_size,totals,labels,
  main="Acquisition of the sample (staircasePlot)",
  total.col="gray",inc.col=2:4,bg.col="#eeeebb",direction="s")



