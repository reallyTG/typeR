library(ggm)


### Name: plotGraph
### Title: Plot of a mixed graph
### Aliases: plotGraph
### Keywords: graphs adjacency matrix mixed graphs plot

### ** Examples

exvec<-c("b",1,2,"b",1,14,"a",9,8,"l",9,11,
         "a",10,8,"a",11,2,"a",11,9,"a",11,10,
         "a",12,1,"b",12,14,"a",13,10,"a",13,12)
plotGraph(exvec)
############################################
amat<-matrix(c(0,11,0,0,10,0,100,0,0,100,0,1,0,0,1,0),4,4)
plotGraph(amat)     
plotGraph(makeMG(bg = UG(~a*b*c+ c*d), dg = DAG(a ~ x + z, b ~ z )))
plotGraph(makeMG(bg = UG(~a*b*c+ c*d), dg = DAG(a ~ x + z, b ~ z )), dashed = TRUE)    
# A graph with double and triple edges
G <-
structure(c(0, 101, 0, 0, 100, 0, 100, 100, 0, 100, 0, 100, 0, 
111, 100, 0), .Dim = c(4L, 4L), .Dimnames = list(c("X", "Z", 
"Y", "W"), c("X", "Z", "Y", "W")))
plotGraph(G)      
# A regression chain graph with longer labels
 plotGraph(makeMG(bg = UG(~Love*Constraints+ Constraints*Reversal+ Abuse*Distress), 
   dg = DAG(Love ~ Abuse + Distress, Constraints ~ Distress, Reversal ~ Distress, 
   Abuse ~ Fstatus, Distress ~ Fstatus), 
   ug = UG(~Fstatus*Schooling+ Schooling*Age)), 
   dashed = TRUE, noframe = TRUE)    
# A graph with 4 edges between two nodes. 
G4 = matrix(0, 2, 2); G4[1,2] = 111; G4[2,1] = 111
plotGraph(G4)



