library(rotations)


### Name: nickel
### Title: Nickel electron backscatter diffraction data set
### Aliases: nickel
### Keywords: datasets

### ** Examples

data(nickel) #Load the dataset
Rep1 <- subset(nickel, rep == 1) #Subset the data to include only the first scan

#Get a rough idea of how the grain map looks by plotting the first 
#element of the rotation matrix at each location
qplot(xpos, ypos, data = Rep1, colour = V1, size = I(2))

#Focus in on a particular location, for example location 698
Rs <- subset(nickel, location == 698) 
 
Rs <- as.SO3(Rs[,5:13])     #Translate the Rs data.frame into an object of class 'SO3'
Rs <- Rs[is.SO3(Rs),]       #Some observations are not rotations, remove them
mean(Rs)                    #Estimate the central orientation with the average
median(Rs)                  #Resetimate central orientation robustly
## Not run: 
##D plot(Rs, col = c(1, 2, 3))  #Visualize the location, there appears to be two groups
## End(Not run)



