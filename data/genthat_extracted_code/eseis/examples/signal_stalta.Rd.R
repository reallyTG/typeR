library(eseis)


### Name: signal_stalta
### Title: Calculate stal-lta-ratio.
### Aliases: signal_stalta
### Keywords: eseis

### ** Examples


## load example data
data(rockfall)

## filter signal
rockfall_f <- signal_filter(data = rockfall_eseis,
                            f = c(1, 90), 
                            p = 0.05)
                    
## calculate signal envelope
rockfall_e <- signal_envelope(data = rockfall_f)

## pick earthquake and rockfall event
signal_stalta(data = rockfall_e,
              sta = 100, 
              lta = 18000, 
              freeze = TRUE, 
              on = 5, 
              off = 3)
              
                     



