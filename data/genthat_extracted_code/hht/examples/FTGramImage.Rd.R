library(hht)


### Name: FTGramImage
### Title: Display Fourier spectrogram
### Aliases: FTGramImage
### Keywords: ts hplot

### ** Examples

data(PortFosterEvent)

dt <- mean(diff(tt))

ft <- list()
ft$nfft <- 4096
ft$ns <- 30
ft$nov <- 29

time.span <- c(5, 10)
freq.span <- c(0, 25)
amp.span <- c(1e-5, 0.0003)
FTGramImage(sig, dt, ft, time.span = time.span, freq.span = freq.span, 
    amp.span = amp.span, pretty = TRUE, img.x.format = "%.1f",
    img.y.format = "%.0f",
    main = "Port Foster Event - Fourier Spectrogram")



