library(gdtools)


### Name: set_dummy_conf
### Title: Set and unset a minimalistic Fontconfig configuration
### Aliases: set_dummy_conf unset_dummy_conf

### ** Examples

if( require("fontquiver") ){
on_appveyor <- function() {
  identical(Sys.getenv("APPVEYOR"), "True")
}

# Use minimal fonts.conf to speed up fc-cache
if (on_appveyor()) {
  set_dummy_conf()
}

unset_dummy_conf()
}



