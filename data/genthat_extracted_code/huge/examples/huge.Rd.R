library(huge)


### Name: huge
### Title: High-dimensional undirected graph estimation
### Aliases: huge

### ** Examples

#generate data
L = huge.generator(n = 50, d = 12, graph = "hub", g = 4)

#graph path estimation using mb
out1 = huge(L$data)
out1
plot(out1)				 #Not aligned	
plot(out1, align = TRUE) #Aligned
huge.plot(out1$path[[3]])

#graph path estimation using the sample covariance matrix as the input.
#out1 = huge(cor(L$data))
#out1
#plot(out1)				 #Not aligned	
#plot(out1, align = TRUE) #Aligned
#huge.plot(out1$path[[3]])

#graph path estimation using ct
#out2 = huge(L$data,method = "ct")
#out2
#plot(out2)

#graph path estimation using glasso
#out3 = huge(L$data, method = "glasso")
#out3
#plot(out3)



