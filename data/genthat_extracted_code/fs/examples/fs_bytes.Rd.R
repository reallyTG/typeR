library(fs)


### Name: fs_bytes
### Title: Human readable file sizes
### Aliases: fs_bytes as_fs_bytes

### ** Examples

fs_bytes("1")
fs_bytes("1K")
fs_bytes("1Kb")
fs_bytes("1Kib")
fs_bytes("1MB")

fs_bytes("1KB") < "1MB"

sum(fs_bytes(c("1MB", "5MB", "500KB")))



