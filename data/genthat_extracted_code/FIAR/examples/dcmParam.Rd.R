library(FIAR)


### Name: dcmParam
### Title: DCM object builder
### Aliases: dcmParam
### Keywords: ~DCM

### ** Examples

## Specify connectivity parameters in a 3 region network with connections 
## from region 1 to region 2 with a strenght of .8 Hz and region 2 to 
## region 3 with .65Hz.
a <- c( 0, 0, 0,
       .7, 0, 0,
        0,.4, 0)   

## Specify 2 experimental manipulations (inputs) where the first directly
## influences region 1 with .4 Hz. and the second region 2 with .2 Hz
c <- c(.4, 0, 0,
        0,.5, 0) 

## Specify the functional connectivities between region 1 and 3 of .2 Hz. 
## caused by input 1. Input 2 influences the functional connectivity from 
## region 3 to region 2.
b <- c(0, 0, 0,
       0, 0, 0,
       0,.2, 0,
       0, 0, 0,
       0, 0,.2,
       0, 0, 0)		

v <- 240            # number of scans 
n <- 3              # number of regions
m <- 2              # number of inputs = number of rows in DCM$c

## The onsets of input 1 are at scan 0, 30, 60, 120, and 200. The onsets of
## input 2 at scan 30, and 120.

ons.input1 <- c(0, 60, 120, 180)
ons.input2 <- c(0, 30, 60, 90, 120)

## The duration of input 1 is always 30 scans. The duration of input 2 is 15
## scans.

dur.input1 <- 30
dur.input2 <- 15
TR <- 1
DCM <- dcmParam(a, b, c, ons=list(ons.input1,ons.input2), 
                 dur=list(dur.input1,dur.input2), v, n, m, TR=1)
names(DCM)

# Or construct DCM by automated step by step:
# DCM <- dcmParam(auto=TRUE)




