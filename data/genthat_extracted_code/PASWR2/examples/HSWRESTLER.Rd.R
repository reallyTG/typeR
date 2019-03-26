library(PASWR2)


### Name: HSWRESTLER
### Title: High School Wrestlers
### Aliases: HSWRESTLER
### Keywords: datasets

### ** Examples

FAT <- c(HSWRESTLER$hwfat, HSWRESTLER$tanfat, HSWRESTLER$skfat)
GROUP <- factor(rep(c("hwfat", "tanfat", "skfat"), rep(78, 3)))
BLOCK <- factor(rep(1:78, 3))
friedman.test(FAT ~ GROUP | BLOCK)
rm(FAT, BLOCK, GROUP)
ggplot(data = HSWRESTLER, aes(x = tanfat, y = hwfat, color = age)) + geom_point() + 
geom_smooth() + labs(x = "Tanita measure of percent fat", 
y = "hydrostatic measure of percent fat")




