library(seasonal)


### Name: import.spc
### Title: Import X-13 '.spc' Files
### Aliases: import.spc print.import.spc

### ** Examples


# importing the orginal X-13 example file
import.spc(text =
'
  series{
    title="International Airline Passengers Data from Box and Jenkins"
    start=1949.01
    data=(
    112 118 132 129 121 135 148 148 136 119 104 118
    115 126 141 135 125 149 170 170 158 133 114 140
    145 150 178 163 172 178 199 199 184 162 146 166
    171 180 193 181 183 218 230 242 209 191 172 194
    196 196 236 235 229 243 264 272 237 211 180 201
    204 188 235 227 234 264 302 293 259 229 203 229
    242 233 267 269 270 315 364 347 312 274 237 278
    284 277 317 313 318 374 413 405 355 306 271 306
    315 301 356 348 355 422 465 467 404 347 305 336
    340 318 362 348 363 435 491 505 404 359 310 337
    360 342 406 396 420 472 548 559 463 407 362 405
    417 391 419 461 472 535 622 606 508 461 390 432)
    span=(1952.01, )
  }
  spectrum{
    savelog=peaks 
  }
  transform{
    function=auto
    savelog=autotransform  
  }
  regression{
    aictest=(td easter)
    savelog=aictest  
  }
  automdl{  
    savelog=automodel  
  }
  outlier{ }
  x11{}
'
)

## Not run: 
##D 
##D ### reading .spc with multiple user regression and transformation series
##D 
##D # running a complex seas call and save output in a temporary directory
##D tdir <- tempdir()
##D seas(x = AirPassengers, xreg = cbind(a = genhol(cny, start = 1, end = 4,
##D     center = "calendar"), b = genhol(cny, start = -3, end = 0,
##D     center = "calendar")), xtrans = cbind(sqrt(AirPassengers), AirPassengers^3), 
##D     transform.function = "log", transform.type = "temporary", 
##D     regression.aictest = "td", regression.usertype = "holiday", dir = tdir, 
##D     out = TRUE)
##D 
##D # importing the .spc file from the temporary location
##D ll <- import.spc(file.path(tdir, "iofile.spc"))
##D 
##D # ll is list containing four calls: 
##D # - 'll$x', 'll$xreg' and 'll$xtrans': calls to import.ts(), which read the
##D #   series from the X-13 data files
##D # - 'll$seas': a call to seas() which performs the seasonal adjustment in R
##D str(ll)
##D 
##D # to replicate the original X-13 operation, run all four calls in a series.
##D # You can either copy/paste and run the print() output:
##D ll
##D 
##D # or use eval() to evaluate the call(s). To evaluate the first call and
##D # import the x variable:
##D eval(ll$x)
##D 
##D # to run all four calls in 'll', use lapply() and eval():
##D ee <- lapply(ll, eval, envir = globalenv())
##D ee$seas  # the 'seas' object, produced by the final call to seas()
## End(Not run)



