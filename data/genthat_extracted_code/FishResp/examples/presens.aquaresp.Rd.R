library(FishResp)


### Name: presens.aquaresp
### Title: Convert Respirometry Data from PreSens and AquaResp Software to
###   the FishResp Format
### Aliases: presens.aquaresp

### ** Examples


presens.path.1 = system.file("extdata/presens/presens-ch1.txt",
                 package = "FishResp")
presens.path.2 = system.file("extdata/presens/presens-ch2.txt",
                 package = "FishResp")
presens.path.3 = system.file("extdata/presens/presens-ch3.txt",
                 package = "FishResp")
presens.path.4 = system.file("extdata/presens/presens-ch4.txt",
                 package = "FishResp")
aquaresp.path = system.file("extdata/presens/presens-aquaresp.txt",
                 package = "FishResp")

presens.aquaresp(presens.file = c(presens.path.1, presens.path.2,
                                  presens.path.3, presens.path.4),
                 aquaresp.file = aquaresp.path,
                 fishresp.file = "fishresp.txt",
                 date.format = "DMY",
                 n.chamber = 4,
                 wait.phase = 60,
                 measure.phase = 240)




