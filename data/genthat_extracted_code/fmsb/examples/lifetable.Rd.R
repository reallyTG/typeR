library(fmsb)


### Name: lifetable
### Title: Lifetable functions with mutual conversions
### Aliases: lifetable lifetable2 lifetable3 clifetable lxtodx dxtolx
###   qxtodx dxtoqx qxtomx mxtoqx qxtolx lxtoqx uxtoqx getax hlifetable
###   Jp2010s

### ** Examples

 lifetable(c(0.0087, 0.00015, 0.00019, 0.00098, 0.0013, 0.0011, 0.0014, 0.0019, 
             0.0029, 0.0048, 0.0071, 0.011, 0.019, 0.028, 0.041, 0.072, 0.11, 
             0.19), class=5, mode=11)
 lifetable2(c(0.008314, 0.000408, 0.000181, 0.000187, 0.000282, 0.000307, 0.000364, 
              0.000566, 0.000884, 0.001445, 0.002485, 0.004210, 0.007219, 0.012054, 
              0.018259, 0.029920, 0.049689, 0.085545, 0.177987), 
              ax = c(0.1, 0.4, rep(0.5, 16), NA), n = c(1, 4, rep(5, 16), NA) )
 lifetable3(lx=c(1.0, 0.8499, 0.8070, 0.7876, 0.7762, 0.7691, 0.7502, 0.7362,
                 0.7130, 0.6826, 0.6525, 0.6223, 0.5898, 0.5535, 0.5106, 0.4585,
                 0.3965, 0.3210, 0.2380, 0.1516, 0.0768, 0.0276, 0.0059, 0.0006, 0),
                 n=c(rep(1, 5), rep(5, 20)), ax=c(0.3, rep(0.5, 24))) # Newell, Table 13.1
 clifetable(Jlife$qx2000F)



