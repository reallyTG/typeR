library(hgutils)


### Name: update_settings
### Title: Update default function settings
### Aliases: update_settings

### ** Examples

foo = function(...) {
  default = list(a=1)
  settings = update_settings(default, ...)
}

## Not run: foo(a=2, b=3)



