library(hyper.fit)


### Name: hyper.basic
### Title: Functions to calculate various basic properties important for
###   line fitting
### Aliases: hyper.basic makecovarray2d makecovarray3d makecovmat2d
###   makecovmat3d makerotmat2d makerotmat3d rotdata2d rotdata3d rotcovmat
###   ranrotcovmat2d ranrotcovmat3d makeranrotmat projX projcovmat
###   projcovarray arrayvecmult
### Keywords: fit utility rotation array matrix covariance

### ** Examples

extheta=30    #Experiment with changing this
exdim='z'     #Experiment with chaging to 'x' or 'y'
exvecx=1:10   #Experiment with changin this
exvecy=1:10   #Experiment with changin this
exvecz=1:10   #Experiment with changin this

print(cbind(exvecx, exvecy))
print(rotdata2d(exvecx, exvecy, extheta))
print(rotdata3d(exvecx, exvecy, exvecz, extheta, exdim))
print(makerotmat2d(extheta))
print(makerotmat3d(extheta, dim=exdim))

exsx=1        #Experiment with changing this
exsy=2        #Experiment with changing this
exsz=3        #Experiment with changing this
excorxy=0.8   #Experiment with changing this between -1 and 1
excorxz=-0.3  #Experiment with changing this between -1 and 1
excoryz=0.5   #Experiment with changing this between -1 and 1

print(makecovmat2d(exsx, exsy, excorxy))
print(makecovmat3d(exsx, exsy, exsz, excorxy, excorxz, excoryz))
print(makecovarray2d(exsx*1:4, exsy*1:4, excorxy))
print(makecovarray3d(exsx*1:4, exsy*1:4, exsz*1:4, excorxy, excorxz, excoryz))

excovmat2d=makecovmat2d(exsx, exsy, excorxy)
excovmat3d=makecovmat3d(exsx, exsy, exsz, excorxy, excorxz, excoryz)
excovarray2d=makecovarray2d(exsx*1:4, exsy*1:4, excorxy)
excovarray3d=makecovarray3d(exsx*1:4, exsy*1:4, exsz*1:4, excorxy, excorxz, excoryz)

print(rotcovmat(excovmat2d, extheta))
print(rotcovmat(excovmat3d, extheta, exdim))
print(ranrotcovmat2d(excovmat2d))
print(ranrotcovmat3d(excovmat3d))

exprojvec2d=c(1, 2)
exprojvec2d=exprojvec2d/sqrt(sum(exprojvec2d^2))
exprojvec3d=c(1, 2, 3)
exprojvec3d=exprojvec3d/sqrt(sum(exprojvec3d^2))

print(projX(cbind(exvecx, exvecy), exprojvec2d))
print(projX(cbind(exvecx, exvecy, exvecz), exprojvec3d))
print(projcovmat(excovmat2d, exprojvec2d))
print(projcovmat(excovmat3d, exprojvec3d))
print(projcovarray(excovarray2d, exprojvec2d))
print(projcovarray(excovarray3d, exprojvec3d))

#Notice that the first outputs of the 2d/3d projcovarray example correspond to the outputs
#of the 2d/3d projcovmat examples.

#First for comparison:

print(t(matrix(1:9,3) %*% 1:3))
print(t(matrix(10:18,3) %*% 1:3))
print(t(matrix(19:27,3) %*% 1:3))

#And now an array example of the above operations:

print(arrayvecmult(array(1:27,c(3,3,3)),1:3))

#And an example where all array dimensions are different:

print(matrix(1:6,2) %*% 1:3)
print(matrix(7:12,2) %*% 1:3)
print(matrix(13:18,2) %*% 1:3)
print(matrix(19:24,2) %*% 1:3)
print(arrayvecmult(array(1:24,c(2,3,4)),1:3))

#Note that the following is not allowed:

## Not run: 
##D print(arrayvecmult(array(1:24,c(3,2,4)),1:3))
## End(Not run)




