library(IndepTest)


### Name: L2OptW
### Title: L2OptW
### Aliases: L2OptW

### ** Examples

# When d < 4 there are no linear constraints and the returned vector is (0,0,...,0,1).
L2OptW(100,3)    
w=L2OptW(100,4)
plot(w,type="l")
w=L2OptW(100,8);
# For each multiple of 4 that d increases an extra constraint is added.
plot(w,type="l")  
w=L2OptW(100,12)
plot(w, type="l") # This can be seen in the shape of the plot




