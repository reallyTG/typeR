library(OpenImageR)


### Name: edge_detection
### Title: edge detection (Frei_chen, LoG, Prewitt, Roberts_cross, Scharr,
###   Sobel)
### Aliases: edge_detection

### ** Examples


path = system.file("tmp_images", "1.png", package = "OpenImageR")

image = readImage(path)

res = edge_detection(image, method = 'Frei_chen', conv_mode = 'same')




