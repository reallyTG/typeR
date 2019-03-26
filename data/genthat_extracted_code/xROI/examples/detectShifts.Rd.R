library(xROI)


### Name: detectShifts
### Title: Detect FOV shift
### Aliases: detectShifts
### Keywords: FOV shift

### ** Examples


cli_path <- system.file(package = 'xROI', 'archboldbahia-cli.jpg')

cor_mat <- detectShifts(cli_path)

plot(cor_mat$brightness.cor)
plot(cor_mat$blue.cor)




