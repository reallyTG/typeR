library(stream)


### Name: DSO_Window
### Title: Sliding Window (Data Stream Operator)
### Aliases: DSO_Window

### ** Examples

stream <- DSD_Gaussians(k=3, d=2, noise=0.05)

window <- DSO_Window(horizon=100)
window

update(window, stream, 200)
window

# plot points in window
plot(get_points(window))



