library(qualityTools)


### Name: mixDesign
### Title: Mixture Designs
### Aliases: mixDesign
### Keywords: Design of Experiments Six Sigma

### ** Examples


#simplex lattice design with center (default response added with NA's)
mixDesign(p = 3, n = 2, center = FALSE)

#simplex lattice design with a center (default response added with NA's)
mixDesign(p = 3, n = 2, center = TRUE)

#simplex lattice design with augmented points (default response added with NA's)
mixDesign(p = 3, n = 2, center = FALSE, axial = TRUE)

#simplex lattice design with augmented points, center and 2 replications 
#(default response added with NA's)
mixDesign(p = 3, n = 2, center = TRUE, axial = TRUE, replicates = 2)

#simplex centroid design giving 2^(p-1) distinct design points 
#(default response added with NA's)
mixDesign(p = 3, n = 2, type = "centroid")

#simplex centroid design with augmented points (default response added with NA's)
mixDesign(p = 3, n = 2, type = "centroid", axial = TRUE)



#yarn elongation example from Cornell (2002)
mdo = mixDesign(3,2, center = FALSE, axial = FALSE, randomize = FALSE, 
                replicates  = c(1,1,2,3))
#set names (optional)
names(mdo) = c("polyethylene", "polystyrene", "polypropylene")
#units(mdo) = "%" #set units (optional)
#set response (i.e. yarn elongation)
elongation = c(11.0, 12.4, 15.0, 14.8, 16.1, 17.7, 16.4, 16.6, 8.8, 10.0, 10.0,
               9.7, 11.8, 16.8, 16.0)  
response(mdo) = elongation

#print a summary of the design
summary(mdo)

#show contourPlot and wirePlot
dev.new(14, 14);par(mfrow = c(2,2))
contourPlot3(A, B, C, elongation, data = mdo, form = "quadratic")
wirePlot3(A, B, C, elongation, data = mdo, form = "quadratic", theta = 190)
wirePlot3(A, B, C, elongation, data = mdo, form = "quadratic", phi = 390, 
          theta = 0)
wirePlot3(A, B, C, elongation, data = mdo, form = "quadratic", phi = 90)



