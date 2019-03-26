library(polysat)


### Name: PIC
### Title: Polymorphic Information Content
### Aliases: PIC
### Keywords: arith

### ** Examples

# generate allele frequencies for this example
myfreq <- data.frame(row.names = c("pop1", "pop2"), 
                     Genomes = c(20,30),
                     loc1.124 = c(0.1, 0.25),
                     loc1.126 = c(0.2, 0),
                     loc1.128 = c(0.05, 0.4),
                     loc1.130 = c(0.3, 0.1),
                     loc1.132 = c(0.1, 0.1),
                     loc1.134 = c(0.25, 0.15),
                     loc2.150 = c(0.4, 0.5),
                     loc2.155 = c(0.3, 0.2),
                     loc2.160 = c(0.3, 0.3))

# estimate PIC
PIC(myfreq)




