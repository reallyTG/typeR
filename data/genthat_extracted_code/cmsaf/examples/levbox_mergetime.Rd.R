library(cmsaf)


### Name: levbox_mergetime
### Title: Function to combine NetCDF files and simultaneously cut a region
###   and level.
### Aliases: levbox_mergetime

### ** Examples

## Create an example NetCDF file with a similar structure
## as used by CM SAF. The file is created with the ncdf4 package.
## Alternatively example data can be freely downloaded here: 
## <https://wui.cmsaf.eu/>

library(ncdf4)

## create some (non-realistic) example data

  lon <- seq(5,15,0.5)
  lat <- seq(45,55,0.5)
  time <- c(as.Date('2000-01-01'), as.Date('2001-02-01'))
  origin <- as.Date('1983-01-01 00:00:00')
  time <- as.numeric(difftime(time,origin,units='hour'))
  level <- c(1:5)
  data1 <- array(250:350,dim=c(21,21,5,1))
  data2 <- array(230:320,dim=c(21,21,5,1))

## create two example NetCDF files

   x <- ncdim_def(name='lon',units='degrees_east',vals=lon)
   y <- ncdim_def(name='lat',units='degrees_north',vals=lat)
   l <- ncdim_def(name='level',units='1',vals=level)
   t <- ncdim_def(name='time',units='hours since 1983-01-01 00:00:00',
   vals=time[1],unlim=TRUE)
   var1 <- ncvar_def('SIS','W m-2',list(x,y,l,t),-1,prec='short')
   vars <- list(var1)
   ncnew <- nc_create('CMSAF_example_file_n1.nc',vars)
   ncvar_put(ncnew,var1,data1)
   ncatt_put(ncnew,'lon','standard_name','longitude',prec='text')
   ncatt_put(ncnew,'lat','standard_name','latitude',prec='text')
   ncatt_put(ncnew,'level','standard_name','level',prec='text')
   nc_close(ncnew)

   t <- ncdim_def(name='time',units='hours since 1983-01-01 00:00:00',
   vals=time[2],unlim=TRUE)
   ncnew <- nc_create('CMSAF_example_file_n2.nc',vars)
   ncvar_put(ncnew,var1,data2)
   ncatt_put(ncnew,'lon','standard_name','longitude',prec='text')
   ncatt_put(ncnew,'lat','standard_name','latitude',prec='text')
   ncatt_put(ncnew,'level','standard_name','level',prec='text')
   nc_close(ncnew)

## Cut a region and levl, and merge both example CM SAF NetCDF files 
## into one output file. First get path information of working directory.
   wd <- getwd()
   levbox_mergetime('SIS',1,wd,'CMSAF_example_file_n',
   'CMSAF_example_file_box_mergetime.nc',8,12,48,52)



