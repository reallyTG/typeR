library(MTA)


### Name: mas
### Title: Multiscalar Absolute Synthesis
### Aliases: mas

### ** Examples

data("GrandParisMetropole")
redistr <- mas(spdf = com.spdf,
                       x = com,
                       spdfid = "DEPCOM",
                       xid = "DEPCOM",
                       var1 = "INC",
                       var2 = "TH",
                       order = 2,
                       key = "EPT",
                       dist = NULL,
                       mat = NULL)
redistr



