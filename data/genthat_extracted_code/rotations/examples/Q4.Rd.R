library(rotations)


### Name: as.Q4
### Title: Quaternions
### Aliases: as.Q4 as.Q4.data.frame as.Q4.default as.Q4.Q4 as.Q4.SO3 id.Q4
###   is.Q4 Q4
### Keywords: datasets

### ** Examples

data(drill)                    #Pull off subject 1's wrist measurements
Subj1Wrist <- subset(drill, Subject == '1' & Joint == 'Wrist')

                               ## The measurements are in columns 5:8
all(is.Q4(Subj1Wrist[,5:8]))   #TRUE, even though Qs is a data.frame, the rows satisfy the
                               #conditions necessary to be quaternions BUT,
                               #S3 methods (e.g. 'mean' or 'plot') for objects of class
                               #'Q4' will not work until 'as.Q4' is used

Qs <- as.Q4(Subj1Wrist[,5:8])  #Coerce measurements into 'Q4' type using as.Q4.data.frame
all(is.Q4(Qs))                 #TRUE
mean(Qs)                       #Estimate central orientation for subject 1's wrist, see ?mean.Q4
Rs <- as.SO3(Qs)               #Coerse a 'Q4' object into rotation matrix format, see ?as.SO3

#Visualize the measuremenets, see ?plot.Q4 for more
## Not run: 
##D plot(Qs, col = c(1, 2, 3))
## End(Not run)



