library(kutils)


### Name: deduper
### Title: Removes redundant words from beginnings of character strings
### Aliases: deduper

### ** Examples

x <- c("Philadelphia_Philadelphia_3", "Denver_Denver_4",
        "Den_Den_Den_Den_Den_Den_Den_5")
deduper(x)
deduper(x, n = 2)
deduper(x, n = 3)
deduper(x, n = 4)
x <- c("Philadelphia,Philadelphia_3", "Denver Denver_4")
## Shows comma also detected by default
deduper(x)
## Works even if delimiter is inside matched string,
## or separators vary
 x <- c("Den_5_Den_5_Den_5,Den_5 Den_5")
deduper(x)
## generate vector
x <- replicate(10, paste(sample(letters, 5), collapse = ""))
n <- c(paste0("_", sample(1:10, 5)), rep("", 5))
x <- paste0(x, "_", x, n, n)
x
deduper(x)




