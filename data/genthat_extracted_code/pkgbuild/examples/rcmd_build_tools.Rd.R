library(pkgbuild)


### Name: rcmd_build_tools
### Title: Call R CMD <command> with build tools active
### Aliases: rcmd_build_tools

### ** Examples

# These env vars are always set
callr::rcmd_safe_env()

if (has_build_tools()) {
  rcmd_build_tools("CONFIG", "CC")$stdout
  rcmd_build_tools("CC", "--version")$stdout
}



