library(pathological)


### Name: is_windows_drive
### Title: Is the path a Windows drive?
### Aliases: is_windows_drive

### ** Examples

x <- c("c:", "c:/", "c:\\", "C:", "C:/", "C:\\", "c:/c", "cc:", NA)
# Warnings about OS suppressed so package checks pass on non-Windows systems.
suppressWarnings(is_windows_drive(x))



