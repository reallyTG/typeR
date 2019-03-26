library(DiallelAnalysisR)


### Name: Hayman
### Title: Diallel Analysis using Hayman Approach
### Aliases: Hayman

### ** Examples

#------------------------------------------
## Diallel Analysis with Haymans's Aproach
#------------------------------------------

Hayman1Data <-
 Hayman(
     y      = Yield
   , Rep    = Rep
   , Cross1 = Cross1
   , Cross2 = Cross2
   , data   = HaymanData
   )

Hayman1Data
names(Hayman1Data)

Hayman1DataMeans <- Hayman1Data$Means
Hayman1DataANOVA <- Hayman1Data$ANOVA
Hayman1DataWr.Vr.Table <- Hayman1Data$Wr.Vr.Table

Hayman1DataComponents.of.Variation <- Hayman1Data$Components.of.Variation
Hayman1DataOther.Parameters <- Hayman1Data$Other.Parameters
Hayman1DataFr <- Hayman1Data$Fr

#----------------
# Wr-Vr Graph
#----------------
VOLO     <- Hayman1Data$VOLO
In.Value <- Hayman1Data$In.Value
a        <- Hayman1Data$a
b        <- Hayman1Data$b
Wr.Vr    <- Hayman1Data$Wr.Vr.Table


library(ggplot2)
ggplot(data=data.frame(x=c(0, max(In.Value, Wr.Vr$Vr, Wr.Vr$Wr, Wr.Vr$Wrei))), aes(x)) +
  stat_function(fun=function(x) {sqrt(x*VOLO)}, color="blue") +
  geom_hline(yintercept = 0) +
  geom_vline(xintercept = 0) +
  geom_abline(intercept = a, slope = b) +
  geom_abline(intercept = mean(Wr.Vr$Wr)-mean(Wr.Vr$Vr), slope = 1) +
  geom_segment(aes(
      x     = mean(Wr.Vr$Vr)
    , y     = min(0, mean(Wr.Vr$Wr))
    , xend  = mean(Wr.Vr$Vr)
    , yend  = max(0, mean(Wr.Vr$Wr))
  )
  , color = "green"
  ) +
  geom_segment(aes(
      x     = min(0, mean(Wr.Vr$Vr))
    , y     = mean(Wr.Vr$Wr)
    , xend  = max(0, mean(Wr.Vr$Vr))
    , yend  = mean(Wr.Vr$Wr)
  )
  , color = "green"
  )  +
  lims(x=c(min(0, Wr.Vr$Vr, Wr.Vr$Wrei), max(Wr.Vr$Vr, Wr.Vr$Wrei)),
       y=c(min(0, Wr.Vr$Wr, Wr.Vr$Wrei), max(Wr.Vr$Wr, Wr.Vr$Wri))
  ) +
  labs(
         x = expression(V[r])
       , y = expression(W[r])
       , title = expression(paste(W[r]-V[r] , " Graph"))
       ) +
  theme_bw()



