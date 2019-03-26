library(sirt)


### Name: parmsummary_extend
### Title: Includes Confidence Interval in Parameter Summary Table
### Aliases: parmsummary_extend

### ** Examples

#############################################################################
## EXAMPLE 1: Toy example parameter summary table
#############################################################################

dfr <- data.frame( "parm"=c("b0", "b1" ), "est"=c(0.1, 1.3 ),
                "se"=c(.21, .32) )
print( sirt::parmsummary_extend(dfr), digits=4 )
  ##    parm est   se      t         p lower95 upper95
  ##  1   b0 0.1 0.21 0.4762 6.339e-01 -0.3116  0.5116
  ##  2   b1 1.3 0.32 4.0625 4.855e-05  0.6728  1.9272



