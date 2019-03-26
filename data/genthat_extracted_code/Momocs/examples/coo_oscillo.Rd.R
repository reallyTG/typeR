library(Momocs)


### Name: coo_oscillo
### Title: Momocs' 'oscilloscope' for Fourier-based approaches
### Aliases: coo_oscillo

### ** Examples

coo_oscillo(shapes[4])
coo_oscillo(shapes[4], 'efourier')
coo_oscillo(shapes[4], 'rfourier')
coo_oscillo(shapes[4], 'tfourier')
#tfourier is prone to high-frequency noise but smoothing can help
coo_oscillo(coo_smooth(shapes[4], 10), 'tfourier')



