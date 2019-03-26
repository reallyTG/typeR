library(arf3DS4)


### Name: fmri.data-class
### Title: arf3DS4 "fmri.data" class
### Aliases: fmri.data-class .fmri.data.aux_file,fmri.data-method
###   .fmri.data.aux_file<-,fmri.data-method
###   .fmri.data.bitpix,fmri.data-method
###   .fmri.data.bitpix<-,fmri.data-method
###   .fmri.data.cal_max,fmri.data-method
###   .fmri.data.cal_max<-,fmri.data-method
###   .fmri.data.cal_min,fmri.data-method
###   .fmri.data.cal_min<-,fmri.data-method
###   .fmri.data.data_type,fmri.data-method
###   .fmri.data.data_type<-,fmri.data-method
###   .fmri.data.data.signed,fmri.data-method
###   .fmri.data.data.signed<-,fmri.data-method
###   .fmri.data.data.type,fmri.data-method
###   .fmri.data.data.type<-,fmri.data-method
###   .fmri.data.datatype,fmri.data-method
###   .fmri.data.datatype<-,fmri.data-method
###   .fmri.data.datavec,fmri.data-method
###   .fmri.data.datavec<-,fmri.data-method
###   .fmri.data.db_name,fmri.data-method
###   .fmri.data.db_name<-,fmri.data-method
###   .fmri.data.descrip,fmri.data-method
###   .fmri.data.descrip<-,fmri.data-method
###   .fmri.data.dim_info,fmri.data-method
###   .fmri.data.dim_info<-,fmri.data-method
###   .fmri.data.dims,fmri.data-method .fmri.data.dims<-,fmri.data-method
###   .fmri.data.endian,fmri.data-method
###   .fmri.data.endian<-,fmri.data-method
###   .fmri.data.extension,fmri.data-method
###   .fmri.data.extension<-,fmri.data-method
###   .fmri.data.extents,fmri.data-method
###   .fmri.data.extents<-,fmri.data-method
###   .fmri.data.filename,fmri.data-method
###   .fmri.data.filename<-,fmri.data-method
###   .fmri.data.filetype,fmri.data-method
###   .fmri.data.filetype<-,fmri.data-method
###   .fmri.data.fullpath,fmri.data-method
###   .fmri.data.fullpath<-,fmri.data-method
###   .fmri.data.glmax,fmri.data-method .fmri.data.glmax<-,fmri.data-method
###   .fmri.data.glmin,fmri.data-method .fmri.data.glmin<-,fmri.data-method
###   .fmri.data.gzipped,fmri.data-method
###   .fmri.data.gzipped<-,fmri.data-method
###   .fmri.data.intent_code,fmri.data-method
###   .fmri.data.intent_code<-,fmri.data-method
###   .fmri.data.intent_name,fmri.data-method
###   .fmri.data.intent_name<-,fmri.data-method
###   .fmri.data.intent_p1,fmri.data-method
###   .fmri.data.intent_p1<-,fmri.data-method
###   .fmri.data.intent_p2,fmri.data-method
###   .fmri.data.intent_p2<-,fmri.data-method
###   .fmri.data.intent_p3,fmri.data-method
###   .fmri.data.intent_p3<-,fmri.data-method
###   .fmri.data.magic,fmri.data-method .fmri.data.magic<-,fmri.data-method
###   .fmri.data.pixdim,fmri.data-method
###   .fmri.data.pixdim<-,fmri.data-method
###   .fmri.data.qform_code,fmri.data-method
###   .fmri.data.qform_code<-,fmri.data-method
###   .fmri.data.qoffset_x,fmri.data-method
###   .fmri.data.qoffset_x<-,fmri.data-method
###   .fmri.data.qoffset_y,fmri.data-method
###   .fmri.data.qoffset_y<-,fmri.data-method
###   .fmri.data.qoffset_z,fmri.data-method
###   .fmri.data.qoffset_z<-,fmri.data-method
###   .fmri.data.quatern_b,fmri.data-method
###   .fmri.data.quatern_b<-,fmri.data-method
###   .fmri.data.quatern_c,fmri.data-method
###   .fmri.data.quatern_c<-,fmri.data-method
###   .fmri.data.quatern_d,fmri.data-method
###   .fmri.data.quatern_d<-,fmri.data-method
###   .fmri.data.regular,fmri.data-method
###   .fmri.data.regular<-,fmri.data-method
###   .fmri.data.scl_inter,fmri.data-method
###   .fmri.data.scl_inter<-,fmri.data-method
###   .fmri.data.scl_slope,fmri.data-method
###   .fmri.data.scl_slope<-,fmri.data-method
###   .fmri.data.session_error,fmri.data-method
###   .fmri.data.session_error<-,fmri.data-method
###   .fmri.data.sform_code,fmri.data-method
###   .fmri.data.sform_code<-,fmri.data-method
###   .fmri.data.sizeof_hdr,fmri.data-method
###   .fmri.data.sizeof_hdr<-,fmri.data-method
###   .fmri.data.slice_code,fmri.data-method
###   .fmri.data.slice_code<-,fmri.data-method
###   .fmri.data.slice_duration,fmri.data-method
###   .fmri.data.slice_duration<-,fmri.data-method
###   .fmri.data.slice_end,fmri.data-method
###   .fmri.data.slice_end<-,fmri.data-method
###   .fmri.data.slice_start,fmri.data-method
###   .fmri.data.slice_start<-,fmri.data-method
###   .fmri.data.srow_x,fmri.data-method
###   .fmri.data.srow_x<-,fmri.data-method
###   .fmri.data.srow_y,fmri.data-method
###   .fmri.data.srow_y<-,fmri.data-method
###   .fmri.data.srow_z,fmri.data-method
###   .fmri.data.srow_z<-,fmri.data-method
###   .fmri.data.toffset,fmri.data-method
###   .fmri.data.toffset<-,fmri.data-method
###   .fmri.data.version,fmri.data-method
###   .fmri.data.version<-,fmri.data-method
###   .fmri.data.vox_offset,fmri.data-method
###   .fmri.data.vox_offset<-,fmri.data-method
###   .fmri.data.xyzt_units,fmri.data-method
###   .fmri.data.xyzt_units<-,fmri.data-method
###   plot,fmri.data,missing-method show,fmri.data-method
###   summary,fmri.data-method
### Keywords: classes

### ** Examples

showClass("fmri.data")



