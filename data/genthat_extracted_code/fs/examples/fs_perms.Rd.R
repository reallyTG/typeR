library(fs)


### Name: fs_perms
### Title: Create, modify and view file permissions
### Aliases: fs_perms as_fs_perms

### ** Examples

# Integer and numeric
fs_perms(420L)
fs_perms(c(511, 420))

# Octal
fs_perms("777")
fs_perms(c("777", "644"))

# Symbolic
fs_perms("a+rwx")
fs_perms(c("a+rwx", "u+rw,go+r"))



