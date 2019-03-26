library(fs)


### Name: path_math
### Title: Path computations
### Aliases: path_math path_real path_split path_join path_abs path_norm
###   path_rel path_common path_has_parent

### ** Examples

## Don't show: 
.old_wd <- setwd(tempdir())
## End(Don't show)
dir_create("a")
file_create("a/b")
link_create(path_abs("a"), "c")

# Realize the path
path_real("c/b")

# Split a path
parts <- path_split("a/b")
parts

# Join it together
path_join(parts)

# Find the absolute path
path_abs("..")

# Normalize a path
path_norm("a/../b\\c/.")

# Compute a relative path
path_rel("/foo/abc", "/foo/bar/baz")

# Find the common path between multiple paths
path_common(c("/foo/bar/baz", "/foo/bar/abc", "/foo/xyz/123"))

# Cleanup
dir_delete("a")
link_delete("c")
## Don't show: 
setwd(.old_wd)
## End(Don't show)



