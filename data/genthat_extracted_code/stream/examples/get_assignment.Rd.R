library(stream)


### Name: get_assignment
### Title: Assignment Data Points to Clusters
### Aliases: get_assignment

### ** Examples

stream <- DSD_Gaussians(k=3, d=2, noise=.05)

dbstream <- DSC_DBSTREAM(r=.1)
update(dbstream, stream, n=100)

# find the assignment for the next 100 points to 
# micro-clusters in dsc. This uses the model's assignemnt function
points <- get_points(stream, n=100)
a <- get_assignment(dbstream, points)
a

# show the MC assignment areas. Assigned points as blue circles and 
# the unassigned points as red dots
plot(dbstream, stream, assignment= TRUE, type="none")
points(points[!is.na(a),], col="blue")
points(points[is.na(a),], col="red", pch=20)

# use nearest neighbor assignment instead 
get_assignment(dbstream, points, method="nn")



