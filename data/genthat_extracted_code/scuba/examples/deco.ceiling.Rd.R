library(scuba)


### Name: deco.ceiling
### Title: Decompression Ceiling for a Diver
### Aliases: deco.ceiling
### Keywords: utilities

### ** Examples

   # diver state after saturation diving on EANx30 at 20 metres
   s <- saturated.state("Z", 20, nitrox(0.30))

   # decompression ceiling for each compartment
   depthceiling <- deco.ceiling(s, "Z")
   round(depthceiling, 2)
   round(max(depthceiling), 2)
   # decompress at 8 metres or deeper

   # flying-after-diving with cabin pressure 0.8 ata
   pressureceiling <- deco.ceiling(s, "Z", "pressure")
   round(pressureceiling, 2)
   any(pressureceiling > 0.8)
   # immediate flying-after-diving is not safe



