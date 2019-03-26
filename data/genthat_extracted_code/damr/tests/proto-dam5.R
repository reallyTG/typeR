
read_dam5_file <- function(path,
                           region_id = 1:32,
                           start_datetime = -Inf,
                           stop_datetime = +Inf,
                           tz = "UTC"){
  # todo check whether region has duplicates/ is in range
  regions <- region_id
  start_datetime <- damr:::parse_datetime(start_datetime, tz = tz)
  stop_datetime <- damr:::parse_datetime(stop_datetime, tz = tz)

  first_last_lines <- damr:::find_dam2_first_last_lines(path,
                                                 start_datetime,
                                                 stop_datetime,
                                                 tz)
  first_line = first_last_lines$id[1]
  last_line = first_last_lines$id[2]
  col_types = do.call(readr::cols_only, DAM5_COLS)

  # todo we do not have to read all regions and when filter.
  # We can already load only the channels we want here.
  df <-readr::read_tsv(path, col_names = names(DAM5_COLS),
                       col_types = col_types,
                       skip = first_line-1,
                       n_max = last_line-first_line+1,
                       progress = F)
  return(df)
  #  return(start_datetime)
  df <- as.data.table(df)
  df <- df[, datetime := paste(date,time, sep=" ")]
  suppressWarnings(
    df <- df[, datetime_posix  := as.POSIXct(strptime(datetime,"%d %b %y %H:%M:%S",tz=tz))]
  )
  df[, datetime := NULL]
  setnames(df, "datetime_posix", "datetime")

  # if start date is not defined, t0 is the first read available, whether or not is is valid!
  if(is.infinite(start_datetime))
    t0 = df$datetime[1]
  else
    t0 = start_datetime

  experiment_id <- paste(format(t0, format = "%F %T"), basename(path),sep="|")
  df <- df[status == 1]
  df <- unique(df, by="datetime")
  df <- df[, (colnames(df) %like% "(channel)|(datetime)"), with=F]
  setnames(df,
           grep("channel_", colnames(df), value = T),
           gsub("channel_", "0", grep("channel_", colnames(df), value = T)))
  df <- melt(df, id="datetime", variable.name = "channel", value.name = "activity")

  dt <- df[ ,. (id = as.factor(sprintf("%s|%02d",experiment_id, as.integer(channel))),
                region_id = as.integer(channel),
                t = as.numeric(datetime-t0, units = "secs"),
                activity=activity)]

  setkeyv(dt, "id")

  dt <- dt[region_id %in% regions]
  meta <- unique(dt[, c("id","region_id")],by="id")

  meta[,experiment_id := experiment_id]
  meta[,start_datetime := t0]

  file_info <- meta[,.(file_info =  list(list(path = path, file = basename(path)))), by="id"]
  meta <- file_info[meta]
  #meta <- met[,file:=basename(path)]
  dt[,region_id:=NULL]

  behavr::behavr(dt,meta)
}


path <- "./tests/testthat/M30_DAM5.txt"
start_datetime = -Inf
stop_datetime = +Inf
tz = "UTC"
start_datetime <- damr:::parse_datetime(start_datetime, tz = tz)
stop_datetime <- damr:::parse_datetime(stop_datetime, tz = tz)
first_last_lines <- damr:::find_dam_first_last_lines(path,
                                                    start_datetime,
                                                    stop_datetime,
                                                    tz)

start_datetime = "2017-12-21 18:00:00"
stop_datetime = "2017-12-21 20:00:00"
start_datetime <- damr:::parse_datetime(start_datetime, tz = tz)
stop_datetime <- damr:::parse_datetime(stop_datetime, tz = tz)
first_last_lines <- damr:::find_dam_first_last_lines(path,
                                                      start_datetime,
                                                      stop_datetime,
                                                      tz)
