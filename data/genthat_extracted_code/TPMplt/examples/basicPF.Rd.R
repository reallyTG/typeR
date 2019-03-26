library(TPMplt)


### Name: basicPF
### Title: Basic fitting function for stress-strain curve.
### Aliases: basicPF
### Keywords: internal

### ** Examples

x <- TPMdata[,1]
y <- TPMdata[,2]

# Using 2 sections: start to x=0.3;
# x=0.3 to the end:
basicPF(x, y, subsec = 0.3)

# Using 3 sections: start to x=0.015;
# from 0.015 to 0.2; from 0.2 to the end:
basicPF(x, y, subsec = c(0.015, 0.2))

# Linear models output:
basicPF(x, y, subsec = c(0.015, 0.2), lmoutput=TRUE)



