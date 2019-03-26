library(cmsaf)


### Name: cmsaf.div
### Title: Divide the fields of two input NetCDF files.
### Aliases: cmsaf.div

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
  data1 <- array(250:350,dim=c(21,21,1))
  data2 <- array(230:320,dim=c(21,21,1))

## create two example NetCDF files

   x <- ncdim_def(name='lon',units='degrees_east',vals=lon)
   y <- ncdim_def(name='lat',units='degrees_north',vals=lat)
   t <- ncdim_def(name='time',units='hours since 1983-01-01 00:00:00',
   vals=time[1],unlim=TRUE)
   var1 <- ncvar_def('SIS','W m-2',list(x,y,t),-1,prec='short')
   vars <- list(var1)
   ncnew <- nc_create('CMSAF_example_file_1.nc',vars)
   ncvar_put(ncnew,var1,data1)
   ncatt_put(ncnew,'lon','standard_name','longitude',prec='text')
   ncatt_put(ncnew,'lat','standard_name','latitude',prec='text')
   nc_close(ncnew)

   t <- ncdim_def(name='time',units='hours since 1983-01-01 00:00:00',
   vals=time[2],unlim=TRUE)
   ncnew <- nc_create('CMSAF_example_file_2.nc',vars)
   ncvar_put(ncnew,var1,data2)
   ncatt_put(ncnew,'lon','standard_name','longitude',prec='text')
   ncatt_put(ncnew,'lat','standard_name','latitude',prec='text')
   nc_close(ncnew)

## Divide the fields of both example CM SAF NetCDF files and write the result 
## into one output file.
   cmsaf.div('SIS','SIS','CMSAF_example_file_1.nc', 'CMSAF_example_file_2.nc', 
   'CMSAF_example_file_div.nc')



