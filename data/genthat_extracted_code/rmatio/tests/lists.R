## rmatio, a R interface to the C library matio, MAT File I/O Library.
## Copyright (C) 2013-2018  Stefan Widgren
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## rmatio is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

library("rmatio")

## For debugging
sessionInfo()

##
## NULL: case-1
##
filename <- tempfile(fileext = ".mat")
n1 <- list(x = 1, y = 2, z = NULL)
write.mat(n1, filename = filename, compression = FALSE, version = c("MAT5"))
stopifnot(identical(read.mat(filename), list(x = 1, y = 2)))
unlink(filename)

## Run the same test with compression
if(rmatio:::have.zlib()) {
    filename <- tempfile(fileext = ".mat")
    write.mat(n1, filename = filename, compression = TRUE, version = c("MAT5"))
    stopifnot(identical(read.mat(filename), list(x = 1, y = 2)))
    unlink(filename)
}
