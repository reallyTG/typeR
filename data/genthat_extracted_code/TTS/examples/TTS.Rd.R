library(TTS)


### Name: TTS
### Title: Time-Temperature Superposition (TTS) analysis
### Aliases: TTS
### Keywords: TTS

### ** Examples

## Polycarbonate dataset
data(PC)
x <- PC
## TTS function applied to polycarbonate.
derive <- TTS(x,reference.temperature=150, method=c("derived","WLF",
              "Arrhenius"))
names(derive)
##[1] "data"    "aT"   "bT"  "TTS.data"  "ref.temp"  "TTS.gam"
##[7] "I.lower"   "I.upper"   "residuals"
## Horizontal shifts vector of modulus versus frequency curves.
derive$aT
## Reference temperature
derive$ref.temp



