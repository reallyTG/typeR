library(mosaicData)


### Name: HeatX
### Title: Data from a heat exchanger laboratory
### Aliases: HeatX
### Keywords: datasets

### ** Examples

# We can test for heat exchange with the environment by check to see if the 
# heat gained by the cold water matches the heat lost by the hot water.
C_p <- 4.182 / 60  # / 60 because measuring m in L/min
HeatX2 <- transform(HeatX, 
                Q.cold = m.cold * C_p * (T.cold.out - T.cold.in),
                Q.hot= m.hot * C_p * (T.hot.out- T.hot.in)
)
HeatX2 <- transform(HeatX2, Q.env = Q.cold + Q.hot)
if (require(ggformula)) {
  gf_jitter( "" ~ Q.env, data = HeatX2, alpha = 0.6, size = 4, 
    width = 0, height = 0.1, seed = 123) %>%
  gf_labs(y = "")
}
if (require(mosaic)) {
  t.test( ~Q.env, data = HeatX2 )
}



