library(arf3DS4)


### Name: nifti.header-class
### Title: arf3DS4 "nifti.header" class
### Aliases: nifti.header-class .nifti.header.aux_file,nifti.header-method
###   .nifti.header.aux_file<-,nifti.header-method
###   .nifti.header.bitpix,nifti.header-method
###   .nifti.header.bitpix<-,nifti.header-method
###   .nifti.header.cal_max,nifti.header-method
###   .nifti.header.cal_max<-,nifti.header-method
###   .nifti.header.cal_min,nifti.header-method
###   .nifti.header.cal_min<-,nifti.header-method
###   .nifti.header.data_type,nifti.header-method
###   .nifti.header.data_type<-,nifti.header-method
###   .nifti.header.data.signed,nifti.header-method
###   .nifti.header.data.signed<-,nifti.header-method
###   .nifti.header.data.type,nifti.header-method
###   .nifti.header.data.type<-,nifti.header-method
###   .nifti.header.datatype,nifti.header-method
###   .nifti.header.datatype<-,nifti.header-method
###   .nifti.header.db_name,nifti.header-method
###   .nifti.header.db_name<-,nifti.header-method
###   .nifti.header.descrip,nifti.header-method
###   .nifti.header.descrip<-,nifti.header-method
###   .nifti.header.dim_info,nifti.header-method
###   .nifti.header.dim_info<-,nifti.header-method
###   .nifti.header.dims,nifti.header-method
###   .nifti.header.dims<-,nifti.header-method
###   .nifti.header.endian,nifti.header-method
###   .nifti.header.endian<-,nifti.header-method
###   .nifti.header.extension,nifti.header-method
###   .nifti.header.extension<-,nifti.header-method
###   .nifti.header.extents,nifti.header-method
###   .nifti.header.extents<-,nifti.header-method
###   .nifti.header.filename,nifti.header-method
###   .nifti.header.filename<-,nifti.header-method
###   .nifti.header.filetype,nifti.header-method
###   .nifti.header.filetype<-,nifti.header-method
###   .nifti.header.fullpath,nifti.header-method
###   .nifti.header.fullpath<-,nifti.header-method
###   .nifti.header.glmax,nifti.header-method
###   .nifti.header.glmax<-,nifti.header-method
###   .nifti.header.glmin,nifti.header-method
###   .nifti.header.glmin<-,nifti.header-method
###   .nifti.header.gzipped,nifti.header-method
###   .nifti.header.gzipped<-,nifti.header-method
###   .nifti.header.intent_code,nifti.header-method
###   .nifti.header.intent_code<-,nifti.header-method
###   .nifti.header.intent_name,nifti.header-method
###   .nifti.header.intent_name<-,nifti.header-method
###   .nifti.header.intent_p1,nifti.header-method
###   .nifti.header.intent_p1<-,nifti.header-method
###   .nifti.header.intent_p2,nifti.header-method
###   .nifti.header.intent_p2<-,nifti.header-method
###   .nifti.header.intent_p3,nifti.header-method
###   .nifti.header.intent_p3<-,nifti.header-method
###   .nifti.header.magic,nifti.header-method
###   .nifti.header.magic<-,nifti.header-method
###   .nifti.header.pixdim,nifti.header-method
###   .nifti.header.pixdim<-,nifti.header-method
###   .nifti.header.qform_code,nifti.header-method
###   .nifti.header.qform_code<-,nifti.header-method
###   .nifti.header.qoffset_x,nifti.header-method
###   .nifti.header.qoffset_x<-,nifti.header-method
###   .nifti.header.qoffset_y,nifti.header-method
###   .nifti.header.qoffset_y<-,nifti.header-method
###   .nifti.header.qoffset_z,nifti.header-method
###   .nifti.header.qoffset_z<-,nifti.header-method
###   .nifti.header.quatern_b,nifti.header-method
###   .nifti.header.quatern_b<-,nifti.header-method
###   .nifti.header.quatern_c,nifti.header-method
###   .nifti.header.quatern_c<-,nifti.header-method
###   .nifti.header.quatern_d,nifti.header-method
###   .nifti.header.quatern_d<-,nifti.header-method
###   .nifti.header.regular,nifti.header-method
###   .nifti.header.regular<-,nifti.header-method
###   .nifti.header.scl_inter,nifti.header-method
###   .nifti.header.scl_inter<-,nifti.header-method
###   .nifti.header.scl_slope,nifti.header-method
###   .nifti.header.scl_slope<-,nifti.header-method
###   .nifti.header.session_error,nifti.header-method
###   .nifti.header.session_error<-,nifti.header-method
###   .nifti.header.sform_code,nifti.header-method
###   .nifti.header.sform_code<-,nifti.header-method
###   .nifti.header.sizeof_hdr,nifti.header-method
###   .nifti.header.sizeof_hdr<-,nifti.header-method
###   .nifti.header.slice_code,nifti.header-method
###   .nifti.header.slice_code<-,nifti.header-method
###   .nifti.header.slice_duration,nifti.header-method
###   .nifti.header.slice_duration<-,nifti.header-method
###   .nifti.header.slice_end,nifti.header-method
###   .nifti.header.slice_end<-,nifti.header-method
###   .nifti.header.slice_start,nifti.header-method
###   .nifti.header.slice_start<-,nifti.header-method
###   .nifti.header.srow_x,nifti.header-method
###   .nifti.header.srow_x<-,nifti.header-method
###   .nifti.header.srow_y,nifti.header-method
###   .nifti.header.srow_y<-,nifti.header-method
###   .nifti.header.srow_z,nifti.header-method
###   .nifti.header.srow_z<-,nifti.header-method
###   .nifti.header.toffset,nifti.header-method
###   .nifti.header.toffset<-,nifti.header-method
###   .nifti.header.version,nifti.header-method
###   .nifti.header.version<-,nifti.header-method
###   .nifti.header.vox_offset,nifti.header-method
###   .nifti.header.vox_offset<-,nifti.header-method
###   .nifti.header.xyzt_units,nifti.header-method
###   .nifti.header.xyzt_units<-,nifti.header-method
### Keywords: classes

### ** Examples

showClass("nifti.header")



