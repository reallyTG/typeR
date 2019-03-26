library(psych)


### Name: mediate
### Title: Estimate and display direct and indirect effects of mediators
###   and moderator in path models
### Aliases: mediate mediate.diagram moderate.diagram
### Keywords: multivariate models

### ** Examples
 
# A simple mediation example is the Tal_Or data set (pmi for Hayes)
#The pmi data set from Hayes is available as the Tal_Or data set. 
mediate(reaction ~ cond + (pmi), data =Tal_Or,n.iter=50) 

#Moderated mediation is done with the Garcia (Garcia, 2010) data set.
# (see Hayes, 2013 for the protest data set

#n.iter set to 50 (instead of default of 5000) for speed of example #old style
data(GSBE)   #The Garcia et al data set (aka GSBE)
mediate(liking ~  sexism * prot2 + (respappr), data=Garcia, n.iter = 50)
#to see this interaction graphically, run the examples in ?Garcia


#data from Preacher and Hayes (2004)
sobel <- structure(list(SATIS = c(-0.59, 1.3, 0.02, 0.01, 0.79, -0.35, 
-0.03, 1.75, -0.8, -1.2, -1.27, 0.7, -1.59, 0.68, -0.39, 1.33, 
-1.59, 1.34, 0.1, 0.05, 0.66, 0.56, 0.85, 0.88, 0.14, -0.72, 
0.84, -1.13, -0.13, 0.2), THERAPY = structure(c(0, 1, 1, 0, 1, 
1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 0, 1, 0, 1, 1, 1, 0, 1, 
1, 1, 1, 0), value.labels = structure(c(1, 0), .Names = c("cognitive", 
"standard"))), ATTRIB = c(-1.17, 0.04, 0.58, -0.23, 0.62, -0.26, 
-0.28, 0.52, 0.34, -0.09, -1.09, 1.05, -1.84, -0.95, 0.15, 0.07, 
-0.1, 2.35, 0.75, 0.49, 0.67, 1.21, 0.31, 1.97, -0.94, 0.11, 
-0.54, -0.23, 0.05, -1.07)), .Names = c("SATIS", "THERAPY", "ATTRIB"
), row.names = c(NA, -30L), class = "data.frame", variable.labels = structure(c("Satisfaction", 
"Therapy", "Attributional Positivity"), .Names = c("SATIS", "THERAPY", 
"ATTRIB")))
 #n.iter set to 50 (instead of default of 5000) for speed of example

#There are several forms of input.  The original specified y, x , and the mediator 
#mediate(1,2,3,sobel,n.iter=50)  #The example in Preacher and Hayes
#As of October, 2017 we can specify this in a formula mode
mediate (SATIS ~ THERAPY + (ATTRIB),data=sobel, n.iter=50) #specify the mediator by 
# adding parentheses


#Data from sem package taken from Kerckhoff (and in turn, from Lisrel manual)
R.kerch <- structure(list(Intelligence = c(1, -0.1, 0.277, 0.25, 0.572, 
0.489, 0.335), Siblings = c(-0.1, 1, -0.152, -0.108, -0.105, 
-0.213, -0.153), FatherEd = c(0.277, -0.152, 1, 0.611, 0.294, 
0.446, 0.303), FatherOcc = c(0.25, -0.108, 0.611, 1, 0.248, 0.41, 
0.331), Grades = c(0.572, -0.105, 0.294, 0.248, 1, 0.597, 0.478
), EducExp = c(0.489, -0.213, 0.446, 0.41, 0.597, 1, 0.651), 
    OccupAsp = c(0.335, -0.153, 0.303, 0.331, 0.478, 0.651, 1
    )), .Names = c("Intelligence", "Siblings", "FatherEd", "FatherOcc", 
"Grades", "EducExp", "OccupAsp"), class = "data.frame", row.names = c("Intelligence", 
"Siblings", "FatherEd", "FatherOcc", "Grades", "EducExp", "OccupAsp"
))

 #n.iter set to 50 (instead of default of 5000) for speed of demo
#mod.k <- mediate("OccupAsp","Intelligence",m= c(2:5),data=R.kerch,n.obs=767,n.iter=50)
#new style 
mod.k <- mediate(OccupAsp ~ Intelligence + (Siblings) + (FatherEd) + (FatherOcc) + 
(Grades), data = R.kerch, n.obs=767, n.iter=50)

mediate.diagram(mod.k) 
#print the path values 
mod.k

#Compare the following solution to the path coefficients found by the sem package

#mod.k2 <- mediate(y="OccupAsp",x=c("Intelligence","Siblings","FatherEd","FatherOcc"),
#     m= c(5:6),data=R.kerch,n.obs=767,n.iter=50)
#new format 
mod.k2 <- mediate(OccupAsp ~ Intelligence + Siblings + FatherEd + FatherOcc + (Grades) + 
(EducExp),data=R.kerch, n.obs=767, n.iter=50)
mediate.diagram(mod.k2,show.c=FALSE) #simpler output 
#print the path values
mod.k2






