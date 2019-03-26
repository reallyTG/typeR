library(mrfDepth)


### Name: mfdmedian
### Title: Multivariate functional median for functional data.
### Aliases: mfdmedian
### Keywords: functional

### ** Examples

# We will illustrate the function using a bivariate functional sample.
data(characterA)
Data <- characterA[,1:50,]
Result <- mfdmedian(Data)

par(mfrow = c(1,2))
matplot(Data[,,1], type = "l", col = "black", lty = 1, ylab = "x-coordinate")
matlines(Result$MFDmedian[,1], type = "l", col = "red", lty = 1)
matpoints(Result$MFDmedian[,1], col = "red", pch = 15)
matplot(Data[,,2], type = "l", col = "black", lty = 1, ylab = "y-coordinate")
matlines(Result$MFDmedian[,2], type = "l", col = "red", lty = 1)
matpoints(Result$MFDmedian[,2], col = "red", pch = 15)
par(mfrow = c(1,1))

# Other depth function such as adjusted outlyingness may also 
# used to determine the cross-sectional depth median. 
# In this case the depth median is calculated by the 
# sprojmedian routine. 
# When different depth median are available, a specific depth
# median can be selected usinf the centerOption. Optional 
# arguments used by the sprojmedian routine may be specified
# using the depthOptions. For example one might choose the
# "Rotation" equivariance for 300 directions. 
Result <- mfdmedian(Data, type = "sprojdepth",
                    depthOptions = list(type = "Rotation",
                                        ndir = 300),
                    centerOption = "gravity")
par(mfrow = c(1,2))
matplot(Data[,,1], type = "l", col = "black", lty = 1, ylab = "x-coordinate")
matlines(Result$MFDmedian[,1], type = "l", col = "red", lty = 1)
matpoints(Result$MFDmedian[,1], col = "red", pch = 15)
matplot(Data[,,2], type = "l", col = "black", lty = 1, ylab = "y-coordinate")
matlines(Result$MFDmedian[,2], type = "l", col = "red", lty = 1)
matpoints(Result$MFDmedian[,2], col = "red", pch = 15)
par(mfrow = c(1,1))

# If the user already placed a call to the mdf routine
# with the diagnostic options set to TRUE, the 
# mfdmedian can easily be obtained by passing the cross-sectional 
# depths. This drastically saves computing time.  
tResult <- mfd(x = Data, type = "sprojdepth", diagnostic = TRUE)
Result <- mfdmedian(Data, type = "sprojdepth",
                    crossDepthsX = tResult$crossdepthX,
                    centerOption = "gravity")



