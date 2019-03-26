library(Momocs)


### Name: color_palettes
### Title: Some color palettes
### Aliases: color_palettes col_summer Palettes col_summer2 col_spring
###   col_autumn col_black col_solarized col_gallus col_qual col_heat
###   col_hot col_cold col_sari col_india col_bw col_grey

### ** Examples


wheel <- function(palette, n=10){
 op <- par(mar=rep(0, 4)) ; on.exit(par(op))
 pie(rep(1, n), col=palette(n), labels=NA, clockwise=TRUE)}

 # Qualitative
 wheel(col_qual)
 wheel(col_solarized)
 wheel(col_summer)
 wheel(col_summer2)
 wheel(col_spring)
 wheel(col_autumn)

 # Divergent
 wheel(col_gallus)
 wheel(col_india)

 # Sequential
 wheel(col_heat)
 wheel(col_hot)
 wheel(col_cold)
 wheel(col_sari)
 wheel(col_bw)
 wheel(col_grey)

 # Black only for pubs
 wheel(col_black)



